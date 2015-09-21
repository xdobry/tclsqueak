IDE::CompView instproc fillMenuStruct ms {
    $ms enablementHandler [self]

    set new [IDE::MenuStruct create ${ms}::new {New}]
    $ms addCascadeMenu $new
    $new addMenuItem [IDE::MenuCommand new -childof [self] -name {Component...} -command [list [self] newComponent] -popdownMenu 1]
    $new addMenuItem [IDE::MenuCommand new -childof [self] -name {GUI Window Wizard...} -command [list [self] openUIwizard] -popdownMenu 1]
    $new addMenuItem [IDE::MenuCommand new -childof [self] -name {Script Editor} -command [list IDE::Transcript newBrowser] -popdownMenu 1]
    
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -accelerator {Control-T} -name {Open Type...} -command [list [self] searchClass] -popdownMenu 1]
    $ms addSeparator
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name {Rename...} -command [list [self] dispatchWithSelected renameComponent] -popdownMenu 1 -enableList [list isValidSelection]]
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name {Set Version Number...} -command [list [self] dispatchWithSelected setVersion] -popdownMenu 1 -enableList [list isValidSelection]]
    if {[IDE::System isDatabase]} {
        $ms addMenuItem [IDE::MenuCommand new -childof [self] -name "Load Component..." -command [list [self] loadComponent]]
    }
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name "Unload Component" -command [list [self] dispatchWithSelected unloadComponent] -popdownMenu 1 -enableList [list isValidSelection]]
    $ms addSeparator

    set import [IDE::MenuStruct create ${ms}::import {Import}]
    $ms addCascadeMenu $import
    $import addCommand {Load Component from File...} [list [self] importFromSource]
    $import addCommand3 {Register Class From Interp} [list [self] dispatchWithSelected registerClass] isValidSelection
    $import addCommand3 {Register Tcl proc From Interp} [list [self] registerTclProcs] isValidSelection

    set export [IDE::MenuStruct create ${ms}::export {Export}]
    $ms addCascadeMenu $export
    $export addMenuItem [IDE::MenuCommand new -childof [self] -name {Save Component to File...} -command [list [self] dispatchWithSelected saveAsSource] -popdownMenu 0 -enableList [list isValidSelection]]
    $export addCommand {Component File Export...} [list IDE::ComponentSaveWizard newBrowser]
    $export addCommand {Deploy as Executable...} [list [self] deployAs exe]
    $export addCommand {Deploy as TclKit...} [list [self] deployAs kit]
    $export addCommand {Deploy as Script Directory...} [list [self] deployAs directory]
    $export addCommand {As File Tree (for GIT)...} [list IDE::ComponentSaveWizard newFileTreeExport]
    $export addCommand {Quick Save All Components} [list IDE::Component saveAllToPath]

    #$ms addCommand {Set auto_path} [list [self] setAutoPath]
    $ms addCommand {Load Tcl Package} [list [self] loadPackage]
    my menuInsertions $ms
    next
}

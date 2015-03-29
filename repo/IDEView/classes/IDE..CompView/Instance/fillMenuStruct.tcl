IDE::CompView instproc fillMenuStruct ms {
    $ms enablementHandler [self]

    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name New -command [list [self] newComponent] -popdownMenu 1]
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -accelerator {Control-T} -name {Find Class} -command [list [self] searchClass] -popdownMenu 1]
    $ms addSeparator
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name Rename -command [list [self] dispatchWithSelected renameComponent] -popdownMenu 1 -enableList [list isValidSelection]]
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name {Set Version Number} -command [list [self] dispatchWithSelected setVersion] -popdownMenu 1 -enableList [list isValidSelection]]
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name {Save as Source} -command [list [self] dispatchWithSelected saveAsSource] -popdownMenu 0 -enableList [list isValidSelection]]
    $ms addMenuItem [IDE::MenuCommand new -childof [self] -name Unload -command [list [self] dispatchWithSelected unloadComponent] -popdownMenu 1 -enableList [list isValidSelection]]
    $ms addSeparator
    IDE::MenuStruct create ${ms}::spezial {Low level Functions}
    $ms addCascadeMenu ${ms}::spezial
    ${ms}::spezial addCommand {Refresh From Interp} [list [self] refreshFromInterpreter]
    ${ms}::spezial addCommand3 {Register Class From Interp} [list [self] dispatchWithSelected registerClass] isValidSelection
    ${ms}::spezial addCommand3 {Register Tcl proc From Interp} [list [self] registerTclProcs] isValidSelection

    ${ms}::spezial addCommand {Run pkg_mkIndex} [list [self] runPkgMkIndex]
    ${ms}::spezial addCommand {Change Working Dir} [list [self] changeWorkingDir]
    ${ms}::spezial addCommand {Run Script} [list [self] loadFromSource]

    #$ms addCommand {Set auto_path} [list [self] setAutoPath]
    $ms addCommand {Load Package} [list [self] loadPackage]
    $ms addCommand {Import Source} [list [self] importFromSource]
    my menuInsertions $ms
    $ms addSeparator
    $ms addCommand {Save Components} [list IDE::ComponentSaveWizard newBrowser]
    $ms addCommand {Save All} [list IDE::Component saveAllToPath]
    next
}

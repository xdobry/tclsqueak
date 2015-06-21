IDE::System proc getMenuStructForMaster master {
    set mobj ${master}::ms
    set ms [IDE::MenuStruct create $mobj System 0]
    $ms addMenuItem [IDE::MenuCommand new -childof $mobj -accelerator {F5} -name {Component Browser} -command [list IDE::CompBrowser newBrowser]]
    $ms addCommand {Script Editor} [list IDE::Transcript newBrowser]
    $ms addCommand {Namespaces Browser} [list IDE::NSBrowser newBrowser]

    $ms addSeparator
    $ms addCheckButton {Enable Breakpoints} IDE::Debugger::shouldHalt {}

    set tools [IDE::MenuStruct create ${ms}::tools {Developing Tools}]
    $ms addCascadeMenu $tools
    $tools addCommand {Interpreter Browser} [list IDE::InterpBrowser newBrowser]
    $tools addCommand {Syntax Checker} [list IDE::SyntaxChecker newBrowser]
    $tools addCommand {Method Tracker Browser} [list IDE::TrackerBrowser openBrowser]
    $tools addCommand {Variable Tracker Browser} [list IDE::VarsTracker newBrowser]
    $tools addCommand {Coverage Analyse Browser} [list IDE::CallingCoverBrowser newBrowser]
    $tools addCommand {Breakpoints Browser} [list IDE::BreakpointsBrowser newBrowser]
    $tools addCommand {Global Vars Inspector} [list IDE::GlobalVarsInspector startBrowser]
    $tools addCommand {Configuration Map Browser}  [list IDE::ConfigurationBrowser showBrowser]

    global tcl_platform
    if {[my isWindowsPlatform] && [info procs console] ne ""} {
        $ms addCommand {Tcl Console} [list console show]
    }
    set help [IDE::MenuStruct create ${ms}::help {Help (external links)}]
    $ms addCascadeMenu $help
    $help addCommand {Tcl/Tk Homepage} [list IDE::System openHTMLBrowser {http://www.tcl.tk}]
    $help addCommand {XOTcl Manual} [list IDE::System openHTMLBrowser {http://www.xotcl.org/xotclide/}]
    $help addCommand {TclSqueak Manual} [list IDE::System openHTMLBrowser {http://www.xdobry.de/xotclIDE/docs}]
    $help addCommand {Tcl/Tk Wiki} [list IDE::System openHTMLBrowser {http://mini.net/tcl}]
    $help addCommand {TclSqueak on Wiki} [list IDE::System openHTMLBrowser {http://mini.net/tcl/2131}]

    set special [IDE::MenuStruct create ${ms}::special {Low level Functions}]
    $ms addCascadeMenu $special
    $special addCommand {Run Script} [list IDE::System loadFromSource]
    $special addCommand {Run pkg_mkIndex} [list IDE::System runPkgMkIndex]
    $special addCommand {Change Working Dir} [list IDE::System changeWorkingDir]

    $ms addSeparator

    $ms addCommand {Heritage Browser} [list IDE::System heritageDialog $master]
    $ms addCommand {Inspect All Objects} [list IDE::ObjectBrowser browseAllObjects]
    $ms addCommand {Inspect All Object Instances} [list IDE::ObjectBrowser browseAllObjectInstances]
    $ms addCommand {Search Implementors} [list IDE::MethodBrowser searchImplementorsDialog $master]
    $ms addCommand {Search Breakpoints} [list IDE::MethodBrowser searchBreakPoints $master]
    $ms addMenuItem [IDE::MenuCommand new -childof $mobj -name "Search Text" -command [list IDE::MethodBrowser searchTextAllDialog $master] -accelerator F4]

    IDE::PlugInsManager getMenuStruct $ms

    if {[my isDatabase]} {
       set vcontrol [IDE::MenuStruct create ${ms}::vcontrol {Version Control}]
       $ms addCascadeMenu $vcontrol
       $vcontrol addCommand {Show Fresh Methods} [list [self] showFreshMethods]
       $vcontrol addCommand {Sql Monitor} [list [self] loadExtras sqlDebuger]
       $vcontrol addCommand {Configuration Browser} [list [self] loadExtras Configuration]
    }
    $ms addSeparator
    $ms addCommand {Preferences} [list IDE::PreferencesDialog newBrowser]
    $ms addCommand "Quit TclSqueak" [list IDE::System exitIDEGUI]
    return $ms
}

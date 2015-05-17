IDE::System proc getMenuStruct {} {
    set mobj [self]::ms
    if {[Object isobject $mobj]} {
        return $mobj
    }
    set ms [IDE::MenuStruct create $mobj System 0]
    $ms addMenuItem [IDE::MenuCommand new -childof $mobj -accelerator {F5} -name {Component Browser} -command [list IDE::CompBrowser newBrowser]]
    $ms addCommand {Script Editor} [list IDE::Transcript newBrowser]
    $ms addCommand {Namespaces Browser} [list IDE::NSBrowser newBrowser]

    $ms addSeparator
    $ms addCheckButton {Enable Breakpoints} IDE::Debugger::shouldHalt {}

    IDE::MenuStruct create ${ms}::tools {Developing Tools}
    $ms addCascadeMenu ${ms}::tools
    ${ms}::tools addCommand {Interpreter Browser} [list IDE::InterpBrowser newBrowser]
    ${ms}::tools addCommand {Syntax Checker} [list IDE::SyntaxChecker newBrowser]
    ${ms}::tools addCommand {Method Tracker Browser} [list IDE::TrackerBrowser openBrowser]
    ${ms}::tools addCommand {Variable Tracker Browser} [list IDE::VarsTracker newBrowser]
    ${ms}::tools addCommand {Coverage Analyse Browser} [list IDE::CallingCoverBrowser newBrowser]
    ${ms}::tools addCommand {Breakpoints Browser} [list IDE::BreakpointsBrowser newBrowser]
    ${ms}::tools addCommand {Global Vars Inspector} [list IDE::GlobalVarsInspector startBrowser]
    ${ms}::tools addCommand {Configuration Map Browser}  [list IDE::ConfigurationBrowser showBrowser]

    global tcl_platform
    if {[my isWindowsPlatform]} {
        $ms addCommand {Tcl Console} [list console show]
    }
    IDE::MenuStruct create ${ms}::help {Help (external links)}
    $ms addCascadeMenu ${ms}::help
    ${ms}::help addCommand {Tcl/Tk Homepage} [list IDE::System openHTMLBrowser {http://www.tcl.tk}]
    ${ms}::help addCommand {XOTcl Manual} [list IDE::System openHTMLBrowser {http://www.xotcl.org/xotclide/}]
    ${ms}::help addCommand {TclSqueak Manual} [list IDE::System openHTMLBrowser {http://www.xdobry.de/xotclIDE/docs}]
    ${ms}::help addCommand {Tcl/Tk Wiki} [list IDE::System openHTMLBrowser {http://mini.net/tcl}]
    ${ms}::help addCommand {TclSqueak on Wiki} [list IDE::System openHTMLBrowser {http://mini.net/tcl/2131}]

    IDE::MenuStruct create ${ms}::special {Low level Functions}
    $ms addCascadeMenu ${ms}::special
    ${ms}::special addCommand {Run Script} [list IDE::System loadFromSource]
    ${ms}::special addCommand {Run pkg_mkIndex} [list IDE::System runPkgMkIndex]
    ${ms}::special addCommand {Change Working Dir} [list IDE::System changeWorkingDir]

    $ms addSeparator

    $ms addCommand {Heritage Browser} [list IDE::HeritageBrowser newBrowser]
    $ms addCommand {Inspect All Objects} [list IDE::ObjectBrowser browseAllObjects]
    $ms addCommand {Inspect All Object Instances} [list IDE::ObjectBrowser browseAllObjectInstances]
    $ms addCommand {Search Implementors} [list IDE::MethodBrowser searchImplementorsDialog]
    $ms addCommand {Search Breakpoints} [list IDE::MethodBrowser searchBreakPoints]
    $ms addMenuItem [IDE::MenuCommand new -childof $mobj -name "Search Text" -command [list IDE::MethodBrowser searchTextAllDialog] -accelerator F4]

    IDE::PlugInsManager getMenuStruct $ms

    if {[my isDatabase]} {
       IDE::MenuStruct create ${ms}::vcontrol {Version Control}
       $ms addCascadeMenu ${ms}::vcontrol
       ${ms}::vcontrol addCommand {Show Fresh Methods} [list [self] showFreshMethods]
       ${ms}::vcontrol addCommand {Sql Monitor} [list [self] loadExtras sqlDebuger]
       ${ms}::vcontrol addCommand {Configuration Browser} [list [self] loadExtras Configuration]
    }
    $ms addSeparator
    $ms addCommand {Preferences} [list IDE::PreferencesDialog newBrowser]
    $ms addCommand "Quit XOTclIDE" [list IDE::System exitIDEGUI]
    return $ms
}

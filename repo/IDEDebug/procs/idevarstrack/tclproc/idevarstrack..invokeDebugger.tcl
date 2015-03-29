proc idevarstrack::invokeDebugger {name1 name2 op} {
    IDE::Debugger startDebugging "$op on $name1"
}

proc idevarstrack::invokeMethodDebuggerDirect {commandString ops} {
    IDE::Debugger startDebugging [lindex $commandString 0]
}

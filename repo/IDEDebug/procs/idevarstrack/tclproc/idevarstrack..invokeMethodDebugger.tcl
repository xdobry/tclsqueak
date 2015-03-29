proc idevarstrack::invokeMethodDebugger {commandString ops} {
    puts "invoke debug"
    ::idevarstrack::invokeMethodDebuggerDirect $commandString $ops
}

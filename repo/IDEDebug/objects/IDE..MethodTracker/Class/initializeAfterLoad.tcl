IDE::MethodTracker proc initializeAfterLoad {} {
    my setObjectFilterMethod
    my set ignoreInternalCalls 0
    my set ignoreCallingInfo 0
    my set ignoreArguments 0
    my set methodExit 1
    my set methodEntry 1
    my set callingCover 0
    my set stoutProtokoll 0
    my requireNamespace
}

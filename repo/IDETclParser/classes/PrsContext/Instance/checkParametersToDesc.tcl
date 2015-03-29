PrsContext instproc checkParametersToDesc {command notifier startArg desc} {
    set argMatcher [my getArgumentMatcher]
    $argMatcher parseCommand $command $notifier $startArg $desc
}

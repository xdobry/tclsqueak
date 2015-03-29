IDE::Debugger instproc showArguments {} {
    my instvar entryLevel argumentList realLevel
    set calledIndex  [expr {$entryLevel-$realLevel}]
    [self]::methodedit setTextControler [lindex $argumentList $calledIndex] [self]
}

IDE::Debugger instproc inspectLevel level {
    my instvar objectList entryLevel levelInfo methodList realLevel haltParam
    set realLevel [lindex [lindex $levelInfo $level] 0]
    [self]::local setList [uplevel #$realLevel {::info locals}]
    set calledIndex  [expr {$entryLevel-$realLevel-1}]
    if {$calledIndex<0} {
        if {[info exists haltParam]} {
            set callMethod "halt $haltParam"
        } else {
            set callMethod halt
        }
    } else {
        set callMethod [lindex $methodList $calledIndex]
    }
    [self]::methodedit colorizeText $callMethod
}

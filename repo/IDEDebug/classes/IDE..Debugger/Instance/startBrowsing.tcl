IDE::Debugger instproc startBrowsing {} {
    my instvar entryLevel levelInfo methodList argumentList win
    set stackList {}
    set oldGrab [::grab current]
    if {$oldGrab ne ""} {
        foreach w $oldGrab {
           ::grab release $w
        }
    }
    #uts "cp [self callingproc] co [self callingobject]"
    set entryLevel [expr {[info level]-3}]
    my showLevels
    my inspectLevel 0
    while 1 {
        my vwait action
        update idletasks
        eval [my set action]
    }
    if {$oldGrab ne ""} {
        foreach w $oldGrab {
            ::grab $w
        }
    }
}

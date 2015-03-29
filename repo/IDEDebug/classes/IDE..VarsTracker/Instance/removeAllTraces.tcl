IDE::VarsTracker instproc removeAllTraces var {
    set vname [lindex $var 0]
    IDE::VarsTracker removeTrace $vname read
    IDE::VarsTracker removeTrace $vname write
    IDE::VarsTracker removeTrace $vname watch
}

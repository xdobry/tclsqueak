IDE::VarsTracker instproc removeWriteTrace var {
    IDE::VarsTracker removeTrace [lindex $var 0] write
}

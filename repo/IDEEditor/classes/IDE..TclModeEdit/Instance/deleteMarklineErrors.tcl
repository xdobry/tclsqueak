IDE::TclModeEdit instproc deleteMarklineErrors {} {
    my instvar errorLineWin errorRecIds errorNum
    if {[info exists errorRecIds]} {
        $errorLineWin delete {*}$errorRecIds
    }
    if {[info exists errorNum]} {
        set twin [my getTextWindow]
        for {set i 0} {$i<=$errorNum} {incr i} {
            $twin tag remove e$i 1.0 end
        }
    }
}

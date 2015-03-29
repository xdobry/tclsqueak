IDE::TclModeEdit instproc cleanHighlighting {} {
    set twin [my getTextWindow]
    foreach t {comment quoted variable tclproc ref tvariable} {
        $twin tag remove $t 1.0 end
    }
    my instvar maxRefNum refNum maxVarNum varNum
    if {[info exists maxRefNum]} {
        for {set i 0} {$i<=$refNum} {incr i} {
            $twin tag remove d$i 1.0 end
        }
    }
    if {[info exists maxVarNum]} {
        for {set i 0} {$i<=$varNum} {incr i} {
            $twin tag remove v$i 1.0 end
        }
    }
    set refNum 0
    set varNum 0

}

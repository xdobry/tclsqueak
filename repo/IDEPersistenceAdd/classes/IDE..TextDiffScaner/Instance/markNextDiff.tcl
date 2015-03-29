IDE::TextDiffScaner instproc markNextDiff {} {
    my instvar textLen1 textLen2 textWin1 textWin2 currDiff equalIndex diffAtStart diffAtEnd
    if {[llength $equalIndex]==0} return
    if {$currDiff==0 && $diffAtStart} {
        set end [lindex $equalIndex 0]
        set b1 0
        set b2 0
        set e1 [expr {[lindex [lindex $end 0] 0]-1}]
        set e2 [expr {[lindex [lindex $end 0] 1]-1}]
    } else {
        set begin [lindex $equalIndex $currDiff]
        if {[llength $equalIndex]>$currDiff+1} {
            set end [lindex $equalIndex [expr $currDiff+1]]
            set b1 [expr {[lindex [lindex $begin 1] 0]+1}]
            set b2 [expr {[lindex [lindex $begin 1] 1]+1}]
            set e1 [expr {[lindex [lindex $end 0] 0]-1}]
            set e2 [expr {[lindex [lindex $end 0] 1]-1}]
        } elseif {$diffAtEnd} {
            set b1 [expr {[lindex [lindex $begin 1] 0]+1}]
            set b2 [expr {[lindex [lindex $begin 1] 1]+1}]
            set e1 $textLen1
            set e2 $textLen2
        } else { 
            # exactly the same
            return
        }
    }
    # remove taged
    $textWin1 tag remove hlight 1.0 end
    $textWin2 tag remove hlight 1.0 end
    if {$b1<=$e1} {
        $textWin1 tag add hlight $b1.0 [list $e1.0 lineend]
    }
    if {$b2<=$e2} {
        $textWin2 tag add hlight $b2.0 [list $e2.0 lineend]
    }
    $textWin1 see $b1.0
    $textWin2 see $b2.0
    if {[incr currDiff]>[llength $equalIndex]+$diffAtStart+$diffAtEnd-2} { set currDiff 0}
}

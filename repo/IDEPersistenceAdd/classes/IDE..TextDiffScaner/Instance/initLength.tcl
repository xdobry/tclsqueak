IDE::TextDiffScaner instproc initLength {} {
    my instvar textWin1 textLen1 textWin2 textLen2
    set textLen1 [expr {[lindex [split [$textWin1 index end] .] 0]-1}]
    set textLen2 [expr {[lindex [split [$textWin2 index end] .] 0]-1}]
}

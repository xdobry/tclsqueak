IDE::SyntaxErrorView instproc specificInit {} {
    my instvar win

    message $win.message -text {Found possible syntax error(s)! If you want to prevent checking in this method place magic text "no syntax check" in it.} -width 350

    IDE::NListView create [self]::errorlist $win.errorlist -notify [self] -notifyProc selectError -height 15 -width 50

    frame $win.buttons
    button $win.buttons.cancel -text "Cancel Saving (Esc)" -command [list [self] destroy]
    button $win.buttons.force -text "Force Saving (Enter)" -default active -command [list [self] forceSaving]
    set cancelscript "
               $win.buttons.cancel configure -state active -relief sunken
               update idletasks
               after 100
               [self] destroy"
    set okscript "
               $win.buttons.force configure -state active -relief sunken
               update idletasks
               after 100
               [self] forceSaving
               break"
    bind $win <KeyRelease-Return> $okscript
    bind $win <Escape> $cancelscript
    bind $win <Alt-n> [list [self]::errorlist selectNextItem]
    bind $win <Alt-p> [list [self]::errorlist selectPrevItem]

    pack $win.message  -anchor w -expand yes -fill x
    pack $win.errorlist -fill both -expand yes
    pack $win.buttons -anchor w
    pack $win.buttons.cancel $win.buttons.force -side left
    [self]::errorlist setListUnsorted [ide::lcollect each [my errors] {lindex $each 2}]
    focus $win
    next
}

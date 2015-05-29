IDE::TclModeEdit instproc init args {
    next
    my set useEditMode 1
    my set syntaxHightlight 2
    my set xotclLint 1
    my set beginReturn 0
    my set hasErrors 0
    my set isBraceHL 0
    my set isSelectionSilbing 0
    my set noModifyEvents 1

    set twin [my getTextWindow]
    my instvar win errorLineWin

    set errorLineWin $win.errorLine
    canvas $errorLineWin -width 13
    pack $errorLineWin -side right -fill y -after $win.scroll
}

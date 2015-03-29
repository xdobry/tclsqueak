IDE::IDialogListChooser instproc init {} {
    my instvar win listin listout
    if {![info exists listin]} {
        error {no listin parameter}
    }
    next

    my createGUI

    if {![info exists listout]} {
        set listout {}
    }
    my @listout setList $listout
    my @listin setList $listin

    wm deiconify $win
}

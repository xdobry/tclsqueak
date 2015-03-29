IDE::TclModeEdit instproc saveSource text {
    my instvar hasErrors
    if {$hasErrors==0} {
        if {[my lintIfWanted $text]} {
            next
        } else {
            [my info parent] setStatusBarText "erros recognized press save again to force"
            [my getTextWindow] edit modified 0
            set hasErrors 1
        }
    } else {
        next
        set hasErrors 0
        [my info parent] setStatusBarText "source saved"
    }
}

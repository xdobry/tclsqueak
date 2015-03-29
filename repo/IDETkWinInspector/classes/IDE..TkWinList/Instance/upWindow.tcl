IDE::TkWinList instproc upWindow {} {
    my instvar vwindow
    if {$vwindow ne "" && [winfo exists $vwindow]} {
        my selectFor [winfo parent $vwindow]
    } else {
        my selectFor .
    }
}

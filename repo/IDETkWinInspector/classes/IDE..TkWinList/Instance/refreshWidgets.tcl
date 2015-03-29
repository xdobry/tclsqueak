IDE::TkWinList instproc refreshWidgets {} {
    if {[winfo exists [my set vwindow]]} {
        my selectFor [my set vwindow]
    } else {
        my selectFor .
    }
}

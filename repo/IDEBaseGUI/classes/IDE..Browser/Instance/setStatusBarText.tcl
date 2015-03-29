IDE::Browser instproc setStatusBarText text {
    if {![my exists statusBarTextWin]} return
    [my set statusBarTextWin] configure -text $text
    
}

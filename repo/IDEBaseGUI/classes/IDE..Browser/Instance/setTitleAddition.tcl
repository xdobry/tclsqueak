IDE::Browser instproc setTitleAddition add {
    my instvar win
    wm title [winfo toplevel $win] "[my getTitle] : $add"
    wm iconname [winfo toplevel $win] "[my getTitle] : $add"
}

IDE::ListViewEvent instproc init window {
    next
    bind $window.listbox <ButtonPress-3> [list [self] invokeAction %X %Y]
    my set objectsList {}
    my set sobject {}
}

IDE::DirectFind instproc init {twin ttextWin} {
    my instvar win textWin lastSearchText curMarkSelection
    set win $twin
    set textWin $ttextWin
    set lastSearchText ""
    set curMarkSelection 1.0
    set curMarkSelectionNext 1.0
    frame $win
    entry $win.entry
    set image next_nav
    IDE::Toolbar createImage $image
    ttk::button $win.next -image $image -takefocus 0 -command [list [self] markNextSearch] -style Toolbutton
    set image prev_nav
    IDE::Toolbar createImage $image
    ttk::button $win.prev -image $image -takefocus 0 -command [list [self] markPrevSearch] -style Toolbutton
    ttk::button $win.close -takefocus 0 -command [list [self] hide] -style CloseButton
    
    pack $win.entry $win.next $win.prev $win.close -side left
    bind $win.entry <Escape> [list [self] endFind]
    bind $win.entry <Return> [list [self] markNextSearch]
    bind $win.entry <Shift-Return> [list [self] markPrevSearch]
    bind $win.entry <KeyRelease> [list [self] keyChanged]
}

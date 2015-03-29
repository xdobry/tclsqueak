IDE::DirectFind instproc init {twin ttextWin} {
    my instvar win textWin lastSearchText curMarkSelection
    set win $twin
    set textWin $ttextWin
    set lastSearchText ""
    set curMarkSelection 1.0
    set curMarkSelectionNext 1.0
    frame $win
    entry $win.entry
    pack $win.entry
    bind $win.entry <Escape> [list [self] endFind]
    bind $win.entry <Return> [list [self] markNextSearch]
    bind $win.entry <Shift-Return> [list [self] markPrevSearch]
    bind $win.entry <KeyRelease> [list [self] keyChanged]
}

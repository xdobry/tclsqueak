IDE::SearchResultPanel instproc init twin {
    my instvar win
    set win $twin
    if {[IDE::System isDatabase]} {
        set postFix DB
    } else {
        set postFix ""
    }
    ttk::frame $win
    ttk::button $win.close -text x -command [list [my info parent] closeSearchResult]
    ttk::label $win.info -anchor w
    IDE::MethodListView${postFix} create [my info parent]::@methodlist $win.methodlist -mixin IDE::PopdownOnlyMix

    pack $win.close -anchor e
    pack $win.info -fill x
    pack $win.methodlist -fill both -expand yes
}

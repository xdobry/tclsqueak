IDE::SearchResultPanel instproc init twin {
    my instvar win methodview currentSearch searchHistory
    set currentSearch ""
    set searchHistory [list]
    set win $twin
    if {[IDE::System isDatabase]} {
        set postFix DB
    } else {
        set postFix ""
    }
    ttk::frame $win
    set toolbar [IDE::Toolbar create [self]::@toolbar $win.toolbar]

    $toolbar addCommand "Refresh" [list [self] refresh] refresh 1.0
    $toolbar addCommand "Search History" [list [self] history] search_history 1.1
    $toolbar addCommand "Detach Window" [list [self] detachSearch] main_tab 1.2
    
    ttk::label $win.info -anchor w
    set methodview [IDE::MethodListView${postFix} create [my info parent]::@methodlist $win.methodlist -mixin IDE::PopdownOnlyMix -masterView [my info parent] -height 6]
    pack $win.methodlist -fill both -expand yes -side bottom
    pack $win.toolbar -side right
    pack $win.info -fill x
}

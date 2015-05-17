IDE::CompBrowser instproc setUIState state {
    my instvar win
    my setGeometryFromState $state $win
    if {[dict exists $state currentItem]} {
        [self]::methodview selectHItemRefresh [dict get $state currentItem]
    }
}

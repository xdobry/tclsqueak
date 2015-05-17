IDE::PersistentUIStateSupport instproc setGeometryFromState {dictState win} {
    if {[dict exists $dictState geometry]} {
        wm geometry [winfo toplevel $win] [dict get $dictState geometry]
    }
}

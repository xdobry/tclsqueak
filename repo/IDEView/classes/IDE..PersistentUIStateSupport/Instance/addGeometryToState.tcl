IDE::PersistentUIStateSupport instproc addGeometryToState {dictStateRef win} {
    upvar $dictStateRef dictState
    dict set dictState geometry [wm geometry [winfo toplevel $win]]
}

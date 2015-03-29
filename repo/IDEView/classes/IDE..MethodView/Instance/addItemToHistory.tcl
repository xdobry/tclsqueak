IDE::MethodView instproc addItemToHistory actItem {
    my instvar history historyIndex
    if {[lindex $history $historyIndex] ne $actItem} {
        incr historyIndex
        set history [linsert $history $historyIndex $actItem]
    }
}

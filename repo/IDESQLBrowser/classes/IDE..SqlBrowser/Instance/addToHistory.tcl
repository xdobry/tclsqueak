IDE::SqlBrowser instproc addToHistory command {
    my instvar history historyIndex
    if {[lindex $history $historyIndex] eq $command} return
    incr historyIndex
    set history [linsert $history $historyIndex $command]
    my setNavigationEnablement
}

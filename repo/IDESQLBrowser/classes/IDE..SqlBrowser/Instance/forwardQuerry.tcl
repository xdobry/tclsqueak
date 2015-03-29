IDE::SqlBrowser instproc forwardQuerry {} {
    my instvar history historyIndex
    if {$historyIndex<[expr {[llength $history]-1}]} {
         incr historyIndex 1
         set command [lindex $history $historyIndex]
         [self]::@sqlquerry setText $command
    }
    my setNavigationEnablement
}

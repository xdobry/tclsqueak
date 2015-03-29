IDE::SqlBrowser instproc backQuerry {} {
    my instvar history historyIndex
    if {$historyIndex>=-1} {
         set command [lindex $history $historyIndex]
         incr historyIndex -1
         [self]::@sqlquerry setText $command
    }
    my setNavigationEnablement
}

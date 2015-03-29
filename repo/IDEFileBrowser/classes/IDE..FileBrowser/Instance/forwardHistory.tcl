IDE::FileBrowser instproc forwardHistory {} {
    my instvar history historyIndex currentDic
    if {$historyIndex<[llength $history]-1} {
        incr historyIndex
        set currentDic [lindex $history $historyIndex]
        my refreshFiles 0
    }
}

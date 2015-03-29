IDE::FileBrowser instproc backHistory {} {
    my instvar history historyIndex currentDic
    if {$historyIndex>0} {
        incr historyIndex -1
        set currentDic [lindex $history $historyIndex]
        my refreshFiles 0
    }
}

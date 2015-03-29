IDE::DocGeneratorComponent instproc contentProcs {} {
    set text {}
    foreach obj [lsort [[my componentObj] getProcsGroupsObjects]] {
        append text [my contentProc $obj] <hr> \n
    }
    return $text
}

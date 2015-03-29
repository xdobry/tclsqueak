IDE::DocGeneratorComponent instproc contentObjects {} {
    set text {}
    foreach obj [lsort [[my componentObj] getObjects]] {
        append text [my contentObject $obj] <hr> \n
    }
    return $text
}

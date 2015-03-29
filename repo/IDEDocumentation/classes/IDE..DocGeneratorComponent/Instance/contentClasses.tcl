IDE::DocGeneratorComponent instproc contentClasses {} {
    set text {}
    foreach class [lsort [[my componentObj] getClasses]] {
        append text [my contentClass $class] <hr> \n
    }
    return $text
}

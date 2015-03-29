ReadStringStream instproc copyFromToLineEnd from {
    my instvar string
    if {[regexp -start $from -linestop {.+} $string match]} {
        return $match
    }
    return
}

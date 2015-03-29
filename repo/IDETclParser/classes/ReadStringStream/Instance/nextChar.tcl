ReadStringStream instproc nextChar {} {
    my instvar pos string
    set ret [string index $string $pos]
    incr pos
    return $ret
}

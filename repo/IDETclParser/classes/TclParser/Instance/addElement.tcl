TclParser instproc addElement elem {
    my instvar parseElements
    lappend parseElements $elem
    return $elem
}

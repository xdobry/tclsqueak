PrsArgumentMatcher instproc prepareDesc desc {
    # unify the arg description to form {mult type index}
    set udesc [list]
    set index 0
    foreach a $desc {
        lassign [my getArgDesc $a] mult type
        lappend udesc [list $mult $type $index]
        incr index
    }
    return $udesc
}

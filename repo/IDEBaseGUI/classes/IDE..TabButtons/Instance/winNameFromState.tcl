IDE::TabButtons instproc winNameFromState state {
    my instvar win
    return $win.[string map {" " ""} [string tolower $state]]
}

TclParser instproc extractListTo parent {
    my instvar stream
    my skipCharacters "\t \n"
    while {![$stream atEnd]} {
        set elemList [my getList $parent]
        $parent addElem  $elemList
        my skipCharacters "\t \n"
    }
}

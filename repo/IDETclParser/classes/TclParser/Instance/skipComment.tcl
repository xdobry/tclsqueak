TclParser instproc skipComment {} {
    my instvar stream
    while {[my getChar] eq "#"} {
        my skipUpTo \n
        $stream addPos 1
    }
}

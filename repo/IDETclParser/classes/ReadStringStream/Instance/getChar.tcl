ReadStringStream instproc getChar {} {
    my instvar pos string
    #[self] halt
    string index $string $pos
}

ReadStringStream instproc getFromCurrent len {
    my instvar pos string
    #[self] halt
    string range $string $pos [expr {$pos+$len-1}]
}

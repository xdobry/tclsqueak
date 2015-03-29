ReadStringStream instproc copyFromTo {from to} {
    my instvar string
    string range $string $from $to
}

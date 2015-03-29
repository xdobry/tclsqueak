TclParser instproc getCharWithMasking {} {
    my instvar stream
    set c [$stream getChar]
    if {$c eq "\\" && ![$stream atEnd]} {
        set c [$stream getFromCurrent 2]
    }
    return $c
}

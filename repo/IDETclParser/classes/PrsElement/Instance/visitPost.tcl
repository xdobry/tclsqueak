PrsElement instproc visitPost visitor {
    next
    $visitor visitPost [self]
}

PrsElement instproc visit visitor {
    next
    $visitor visit [self]
}

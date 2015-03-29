PrsElementList instproc visitPost visitor {
    if {[my exists list]} {
        foreach elem [my list] {
            $elem visitPost $visitor
        }
    }
    $visitor visitPost [self]
}

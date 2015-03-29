PrsElementList instproc visit visitor {
    if {[my exists list]} {
        foreach elem [my list] {
            $elem visit $visitor
        }
    }
    $visitor visit [self]
}

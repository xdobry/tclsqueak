SyntaxHighlightVisitor instproc highlightHeaderAsComment {rootElem {shiftLeft 0} {shiftRight 0}} {
    set rootBegin [$rootElem begin]
    if {$rootBegin>0} {
        [my text] tagRange comment [expr {0+$shiftLeft}] [expr {$rootBegin-1+$shiftRight}]
    }
}

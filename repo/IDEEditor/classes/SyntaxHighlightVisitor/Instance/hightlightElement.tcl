SyntaxHighlightVisitor instproc hightlightElement {prsElem tag {shiftLeft 0} {shiftRight 0}} {
    [my text] tagRange $tag [expr {[$prsElem begin]+$shiftLeft}] [expr {[$prsElem end]+1+$shiftRight}]
}

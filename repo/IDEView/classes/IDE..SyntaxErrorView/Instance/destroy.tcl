IDE::SyntaxErrorView instproc destroy {} {
    if {[Object isobject [my editor]]} {
        [my editor] dropAllColorized
    }
    next
}

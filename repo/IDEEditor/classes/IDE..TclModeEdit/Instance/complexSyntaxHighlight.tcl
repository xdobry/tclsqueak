IDE::TclModeEdit instproc complexSyntaxHighlight {} {
    [my set controler] syntaxCheck [my getText] [self]
}

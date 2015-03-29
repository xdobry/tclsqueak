IDE::TclModeEdit instproc syntaxHighlight {} {
    my syntaxHighlightRemove
    switch [my set syntaxHightlight] {
        1 { my simpleSyntaxHighlight }
        2 { my complexSyntaxHighlight }
    }
}

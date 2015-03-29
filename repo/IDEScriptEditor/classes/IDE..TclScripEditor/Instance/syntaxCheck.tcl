IDE::TclScripEditor instproc syntaxCheck {} {
    set context [PrsContext new -volatile]
    set repository [SignatureRepository createSignatureRepositoryFile]
    $context set repository $repository
    set text [my getText]
    $context parseGlobal $text
    $context set errors [list]
    $context parseGlobal $text
    if {[$context exists parser]} {
        set highlighter [SyntaxHighlightVisitor new -volatile -text [self]]
        [[$context set parser] set root] visit $highlighter
    }
    my deleteMarklineErrors
    if {[$context hasErrors]} {
        my highligthErrors [$context set errors]
        return 0
    }
    $repository destroy
}

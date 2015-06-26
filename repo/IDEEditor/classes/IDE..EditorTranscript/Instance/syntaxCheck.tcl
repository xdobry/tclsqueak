IDE::EditorTranscript instproc syntaxCheck {} {
    my instvar scriptIndepend
    if {$scriptIndepend} {
        set context [PrsFileContext new]
        set repository [SignatureRepository createSignatureRepositoryFile]
    } else {
        set context [PrsContext new]
        set repository [SignatureRepository getSignatureRepository]
    }
    $context set repository $repository
    set text [my getText]
    $context parseGlobal $text
    $context set errors [list]
    $context parseGlobal $text
    if {[$context exists parser]} {
        set highlighter [SyntaxHighlightVisitor new -volatile -text [self] -context $context]
        [$context set rootCommand] visit $highlighter
    }
    my deleteMarklineErrors
    if {[$context hasErrors]} {
        my highligthErrors [$context set errors]
    }
    if {$scriptIndepend} {
        $repository destroy
    }
    $context destroy
}

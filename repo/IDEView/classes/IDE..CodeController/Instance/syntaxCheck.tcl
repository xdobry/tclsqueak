IDE::CodeController instproc syntaxCheck {text editor} {
    # !! method is double to IDE::MethodView
    set context [PrsContext new -volatile]
    $context parseAndCheck $text
    if {[$context exists parser] && [[$context set parser] exists root]} {
        set highlighter [SyntaxHighlightVisitor new -volatile -text $editor -context $context]
        [[$context set parser] set root] visit $highlighter
    }
    $editor deleteMarklineErrors
    if {[$context hasErrors]} {
        $editor highligthErrors [$context set errors]
        return 0
    } else {
        return 1
    }

}

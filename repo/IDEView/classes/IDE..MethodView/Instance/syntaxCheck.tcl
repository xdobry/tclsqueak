IDE::MethodView instproc syntaxCheck {text editor {contentDescr {}}} {
    set context [PrsContext new -volatile]
    $context parseAndCheck $text

    if {[$context exists parser]} {
        $editor cleanHighlighting
        if {[[$context set parser] exists root] && [Object isobject [[$context set parser] set root]]} {
            set highlighter [SyntaxHighlightVisitor new -volatile -text $editor -context $context]
            [[$context set parser] set root] visit $highlighter
        } else {
            #my halt
        }
    }
    $editor deleteMarklineErrors
    if {[$context hasErrors]} {
        $editor highligthErrors [$context set errors]
        return 0
    } else {
        return 1
    }

}

IDE::CodeController instproc syntaxCheck {text editor {contentDescr {}}} {
    # !! method is double to IDE::MethodView
    set type [lindex $contentDescr 1]
    if {$type in {Component ProcsGroup} || [string range $type end-2 end] eq "Def" || [string range $type end-9 end] eq "ProcsGroup"} {
        return 1
    }
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

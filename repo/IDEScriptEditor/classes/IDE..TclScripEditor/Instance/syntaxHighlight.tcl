IDE::TclScripEditor instproc syntaxHighlight {} {
    set prs [HighlightGlobalContext new -mixin ParseGlobalContext -volatile -text [self]]
    set text [my getText]
    if {$text ne ""} {
        $prs parseAndVisit $text
    }
}

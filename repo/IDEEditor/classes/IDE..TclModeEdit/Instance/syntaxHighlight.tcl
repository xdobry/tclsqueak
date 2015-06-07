IDE::TclModeEdit instproc syntaxHighlight {} {
    #my syntaxHighlightRemove
    switch [IDEPreferences getParameter syntaxHightlight] {
        1 { 
           my syntaxHighlightRemove
           my simpleSyntaxHighlight
        }
        2 { 
           my complexSyntaxHighlight
        }
    }
}

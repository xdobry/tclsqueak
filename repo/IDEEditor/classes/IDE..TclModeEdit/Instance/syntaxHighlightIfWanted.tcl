IDE::TclModeEdit instproc syntaxHighlightIfWanted {} {
    if {[IDEPreferences getParameter syntaxHightlight] && [my set editMode] eq "xotcl" && [my set vtype] eq "Source"} {
        my syntaxHighlight
    }
}

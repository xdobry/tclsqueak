IDE::TclModeEdit instproc syntaxHighlightIfWanted {} {
    if {[my set syntaxHightlight] && [my set editMode] eq "xotcl" && [my set vtype] eq "Source"} {
        my syntaxHighlight
    }
}

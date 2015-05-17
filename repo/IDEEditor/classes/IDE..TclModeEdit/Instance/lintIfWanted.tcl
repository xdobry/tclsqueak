IDE::TclModeEdit instproc lintIfWanted text {
    if {[my set xotclLint] && [my set editMode] eq "xotcl"} {
        [my set controler] syntaxCheck $text [self] [my getContentDescr]
    } else {
        return 1        
    }
}

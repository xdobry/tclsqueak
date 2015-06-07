IDE::TclModeEdit instproc lintIfWanted text {
    if {[IDEPreferences getParameter syntaxCheck] && [my set editMode] eq "xotcl"} {
        [my set controler] syntaxCheck $text [self] [my getContentDescr]
    } else {
        return 1        
    }
}

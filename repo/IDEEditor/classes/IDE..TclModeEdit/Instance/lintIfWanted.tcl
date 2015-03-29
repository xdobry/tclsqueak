IDE::TclModeEdit instproc lintIfWanted text {
    if {[my set xotclLint] && [my set editMode] eq "xotcl"} {
        return [[my set controler] syntaxCheck $text [self]]
    }
    return 1
}

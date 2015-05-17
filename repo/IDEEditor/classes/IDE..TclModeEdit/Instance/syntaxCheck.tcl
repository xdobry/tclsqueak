IDE::TclModeEdit instproc syntaxCheck {} {
    if  {[my set editMode] eq "xotcl"} {
        return [[my set controler] syntaxCheck [my getText] [self] [my getContentDescr]]
    }
}

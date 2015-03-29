IDE::VarsTracker instproc specificInit {} {
    my instvar win
    IDE::VariableTraceList create [self]::varlist $win.varlist
    grid $win.varlist -column 0 -row 0 -sticky news -columnspan 2
    grid columnconfigure $win 1 -weight 1
    grid rowconfigure $win 0 -weight 1
    my initVarList
    next
}

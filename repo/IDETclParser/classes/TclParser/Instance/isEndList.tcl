TclParser instproc isEndList {} {
    set char [[my stream] getChar]
    expr {[[my stream] atEnd] || [string is space $char] || $char eq ";" || $char eq [my set terminalChar]}
}

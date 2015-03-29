TclParser instproc hasParseErrors {} {
    expr {[my exists parseErrors] && [llength [my set parseErrors]]>0}
}

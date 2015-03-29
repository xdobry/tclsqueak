PrsContext instproc hasErrors {} {
    expr {[my exists errors] && [llength [my set errors]]>0}
}

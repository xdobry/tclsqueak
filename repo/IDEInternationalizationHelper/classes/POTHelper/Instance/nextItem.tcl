POTHelper instproc nextItem {} {
    my setItem [expr {[my set item]+1}]
}

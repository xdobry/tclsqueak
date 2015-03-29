POTHelper instproc prevItem {} {
    my setItem [expr {[my set item]-1}]
}

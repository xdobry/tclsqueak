POTHelper instproc lastItem {} {
    my instvar catalog
    my setItem [expr {[llength $catalog]-1}]
}

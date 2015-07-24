IDE::MethodEdit instproc getContentDescr {} {
    my instvar vclass vctype method
    if {[info exists vclass]} {
        list $vclass $vctype $method
    } else {
        list
    }
}

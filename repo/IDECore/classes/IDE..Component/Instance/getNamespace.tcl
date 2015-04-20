IDE::Component instproc getNamespace {} {
    my instvar namespace
    if {![info exists namespace]} {
        return
    }
    return $namespace
}

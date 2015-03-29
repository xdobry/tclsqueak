IDE::Component instproc getOOType {} {
    my instvar ootype
    if {![info exists ootype]} {
        set ootype XOTcl
    }
    return $ootype

}

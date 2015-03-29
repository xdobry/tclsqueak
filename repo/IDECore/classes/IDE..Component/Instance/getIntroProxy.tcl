IDE::Component instproc getIntroProxy {} {
    my instvar ootype
    if {![info exists ootype]} {
        set ootype XOTcl
    }
    switch $ootype {
        TclOO {
            return [IDE::TclOOIntroProxy getIntroProxy]
        }
        default {
            return [IDE::XOIntroProxy getIntroProxy]
        }
    }
}

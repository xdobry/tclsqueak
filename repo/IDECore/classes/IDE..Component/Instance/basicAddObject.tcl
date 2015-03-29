IDE::Component instproc basicAddObject object {
    # use $object moveToComponent name for right initialisation
    # this is private only
    # this method is not mixin-ed for IDE::ComponentPeristance
    # it is userd internal for loading object directly from VC (Data Base)
    my instvar classes objects
    set introProxy [my getIntroProxy]
    if {[$introProxy isObjectClass $object]} {
        ::ide::lappendIfNone classes [string trimleft $object :]
    } elseif {[$introProxy isObject $object]} {
        ::ide::lappendIfNone objects [string trimleft $object :]
    } else {
        error "$object is not XOTcl Object"
    }
}

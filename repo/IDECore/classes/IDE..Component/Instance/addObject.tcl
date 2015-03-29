IDE::Component instproc addObject object {
    # use $object moveToComponent name for right initialisation
    # this is private only
    my instvar objects
    ::ide::lappendIfNone objects [string trimleft $object :]
}

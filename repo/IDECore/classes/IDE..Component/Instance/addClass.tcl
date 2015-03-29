IDE::Component instproc addClass class {
    # use $object moveToComponent name for right initialisation
    # this is private only
    my instvar classes
    ::ide::lappendIfNone classes [string trimleft $class :]
}

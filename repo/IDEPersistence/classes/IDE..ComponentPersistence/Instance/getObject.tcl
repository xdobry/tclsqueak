IDE::ComponentPersistence instproc getObject name {
    # !!! Check if the name is class/object in component
    set introProxy [my getIntroProxy]
    if {[$introProxy isObject $name]} {
        return [$introProxy getDescriptionForObject $name]
    } else {
        return [my getProcsGroupWithName $name]
    }
}

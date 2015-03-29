IDE::ComponentPersistence instproc setObjectsArray arr_ref {
    my instvar objects classes
    upvar $arr_ref arr
    set introProxy [my getIntroProxy]
    foreach obj $objects {
        set dobj [$introProxy getDescriptionForObject $obj]
        set arr($obj) [$dobj set objectid]
    }
    foreach obj $classes {
        set dobj [$introProxy getDescriptionForObject $obj]
        set arr($obj) [$dobj set objectid]
    }
    foreach obj [my getProcsGroupsObjects] {
        set arr([$obj getObjectName]) [$obj set objectid]
    }
}

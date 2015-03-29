IDE::ComponentPersistence instproc versionEdition {} {
    my instvar isclosed classes objects
    if {[info exists isclosed] && $isclosed==1} return
    set edition_objects [list]
    set introProxy [my getIntroProxy]
    foreach obj [concat [my getObjects] [my getClasses] [my getProcsGroupsObjects]] {
        if {![[$introProxy getDescriptionForObject $obj] isclosed]} {
            lappend edition_objects $obj
        }
    }
    if {[llength $edition_objects]>0} {
        set edition_names [ide::lcollect each $edition_objects {[$introProxy getDescriptionForObject $each] getName}]
        if {[IDE::Dialog yesNo "There are unversioned classes/objects in this component:\n  [join $edition_names \n\ \ ]\nVersion they all?"] ne "yes"} return
        foreach obj $edition_objects {
            [$introProxy getDescriptionForObject $obj] versionEdition
        }
    }
    next
}

IDE::ClassDefinition instproc setClassesList {} {
    my instvar compVisibility classView mode className win introProxy compObj
    set cobj $compObj
    set introProxy [$cobj getIntroProxy]
    if {!$compVisibility} {
        set clist [$introProxy getClasses]
    } else {
        set clist [$cobj getVisibleClasses]
    }
    if {[$cobj getOOType] eq "TclOO"} {
        $win.fpar.lparameter configure -text "variable list"
    }
    set clist [ide::lcollect each $clist {string trimleft $each :}]
    set remove [list xotcl::Class xotcl::Object oo::class oo::object oo::Slot]
    if {$mode eq "redefine"} {
        lappend remove $className
    }
    set supclasses [my @superclass getList]
    foreach sclass $supclasses {
        lappend remove [string trimleft $sclass :]
        foreach c [$introProxy getHeritageFlatForClass $sclass] {
            lappend remove [string trimleft $c :]
        }
        foreach c [$introProxy getSubclassesDeep $sclass] {
            lappend remove [string trimleft $c :]
        }
    }
    ide::lremoveAll clist $remove
    [self]::classlist setList $clist
}

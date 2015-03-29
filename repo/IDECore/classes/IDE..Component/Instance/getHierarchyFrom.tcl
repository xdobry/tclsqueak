IDE::Component instproc getHierarchyFrom classes {
    if {[llength $classes]<=1} {return [string trimleft $classes :]}
    set used {}
    set introProxy [my getIntroProxy]
    # sort classes in heritage order (based classes first)
    foreach c $classes {
        set her [$introProxy getHeritageFlatForClass $c]
        set l 0
        foreach s $her {
            lappend shorder [list $l $s]
            incr l
        }
    }
    set horder [list]
    foreach c [lsort -unique $shorder] {
        set cn [lindex $c 1]
        if {$cn in $classes} {
            ide::lappendIfNone horder $cn
        }
    }
    foreach c $classes {
        if {$c ni $horder} {
            lappend restc $c
        }
    }
    lappend horder {*}[lsort $restc]
    #[self] halt
    foreach c $horder {
        if {$c in $used} continue
        set uc {}
        foreach sc [lsort -unique [$introProxy getDeepChildrenForClass $c]] {
 	    if {$sc in $classes && $sc  ni $used} {
      	        lappend uc $sc
       	        lappend used $sc
            }
        }
        if {$uc ne ""} {
            set root [string trimleft $c :]
            lappend ret [concat $root [my getHierarchyFrom $uc]]
        } else {
            lappend used $c
            lappend ret [string trimleft $c :]
        }
    }
    return $ret
}

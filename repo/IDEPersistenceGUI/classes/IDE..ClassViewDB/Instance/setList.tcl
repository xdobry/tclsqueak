IDE::ClassViewDB instproc setList objs {
    my instvar cobj vtype treeView
    if {![$cobj isPersistent]} {
        next
        return
    } else {
        if {$treeView} {
            set sobjs $objs
        } else {
            set sobjs [lsort $objs]
        }
        my setListUnsorted $sobjs
        if {![$cobj isclosed]} {
            set index 0
            foreach obj $sobjs {
                set obj [string trim $obj]
                if {$vtype eq "Procs"} {
                    set desc [$cobj getProcsGroupWithName $obj]
                } else {
                    set introProxy [$cobj getIntroProxy]
                    set desc [$introProxy getDescriptionForObject $obj]
                }
                if {![$desc isclosed]} {
                    my markItemIndexForeGround $index blue
                }
                incr index
            }
        }
    }
}

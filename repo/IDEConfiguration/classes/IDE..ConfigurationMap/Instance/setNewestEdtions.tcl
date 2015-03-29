IDE::ConfigurationMap instproc setNewestEdtions {} {
    set list [list]
    foreach c [my getComponents] {
        set cname [$c getName]
        set id 0
        set ncomp ""
        foreach c [::IDE::ConfigmapControler getComponentEdition $cname] {
            set nid [$c set componentid]
            if {$nid>$id} {
                set id nid
                set ncomp $c
            }
        }
        if {$ncomp ne ""} {
            lappend list $ncomp     
        }
    }
    my setComponents $list
}

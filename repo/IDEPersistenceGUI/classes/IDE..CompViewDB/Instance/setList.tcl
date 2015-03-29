IDE::CompViewDB instproc setList comps {
    set scomps [lsort $comps]
    my setListUnsorted $scomps
    set index 0
    foreach cname $scomps {
        set cobj [IDE::Component getCompObjectForName $cname]
        if {[$cobj isPersistent]} {
            if {![$cobj isclosed]} {
                my markItemIndexForeGround $index blue
            }
        } else {
            my markItemIndexForeGround $index darkgreen
        }
        incr index
    }
}

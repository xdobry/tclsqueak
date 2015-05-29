IDE::MasterViewMix instproc getViewMaster {} {
    my instvar masterView
    if {[info exists masterView] && $masterView ne ""} {
        return $masterView
    } else {
        return IDE::System
    }
    #ttc rettype xotcl IDE::CompBrowser
}

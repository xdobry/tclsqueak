IDE::Component proc initPackageTracking {} {
    my instvar packagingInited
    if {![info exists packagingInited]} {
        set xp [my getCompObjectForName xotcl::package]
        package require xotcl::package
        $xp addObject package
        $xp addObject package::tracker
        $xp addClass package::tracker::M
    }
    set packagingInited 1
}

IDE::ObjectDescriptionsRepo proc getRepo {} {
    my instvar repo
    if {![info exists repo] || ![Object isobject $repo]} {
        set repo [IDE::ObjectDescriptionsRepo new]
    }
    return $repo
}

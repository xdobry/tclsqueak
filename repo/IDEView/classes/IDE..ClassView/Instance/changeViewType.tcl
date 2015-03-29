IDE::ClassView instproc changeViewType type {
    my set vtype $type
    if {[my exists vcomponent]} {
        my selectFor [my set vcomponent]
    }
}

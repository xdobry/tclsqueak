IDE::TclProcsDescription proc getAllRegisteredMethods {} {
    if {[my array exists methodArr]} {
        return [my array names methodArr]
    }
    return
}

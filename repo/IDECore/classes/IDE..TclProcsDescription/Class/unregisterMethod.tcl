IDE::TclProcsDescription proc unregisterMethod method {
    if {[my exists methodArr($method)]} {
        my unset methodArr($method)
    }
}

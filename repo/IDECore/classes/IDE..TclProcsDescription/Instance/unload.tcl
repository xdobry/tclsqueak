IDE::TclProcsDescription instproc unload {} {
    # TODO namespace proc handling
    if {[info procs ::[my getName]] ne ""} {
        rename ::[my getName] {}
        [self class] unregisterMethod [my getName]
    } else {
        puts stderr "no proc [my getName] in interpreter"
    }
}

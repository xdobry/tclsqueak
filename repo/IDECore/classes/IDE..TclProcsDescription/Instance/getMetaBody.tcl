IDE::TclProcsDescription instproc getMetaBody {} {
    set group [my getGroupObj]
    set script "@ tclproc [my getName] idemeta struct [list [[$group getComponent] getName] [$group getObjectName]]\n"
    if {[my hasComment]} {
        append script "@ tclproc [my getName] idemeta comment [list [my getComment]]\n"
    }
    return $script
}

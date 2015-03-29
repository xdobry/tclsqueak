IDE::Component instproc getPreScript {} {
    set script ""
    if {[my getOOType] eq "XOTcl" && "XOTcl" in [my getSystemRequirements]} {
        append script "namespace import xotcl::*\n"
    }
    return $script
}

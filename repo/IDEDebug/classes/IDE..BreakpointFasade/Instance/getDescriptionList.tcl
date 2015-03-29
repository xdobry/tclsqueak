IDE::BreakpointFasade instproc getDescriptionList {} {
    set class [namespace qualifiers [my method]]
    if {[string match xotcl::classes::* [my method]]} {
        set type Instance
        set class [string range $class [string length xotcl::classes::] end]
        set method [namespace tail [my method]]
    } else {
        if {[Object isobject $class]} {
            set type Class
            set method [namespace tail [my method]]
        } else {
            set type "Tcl Procs"
            set method [my method]
        }
    }
    return [list $class $type $method]
}

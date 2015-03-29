IDE::ProcsGroup instproc handleScript skript {
    if {[llength $skript]!=4 || [lindex $skript 0] ne "proc"} {
        IDE::Dialog error "To define new tcl proc give 4 elements list\n proc ?nameSpace::?procName arguments procBody"
        return
    }

    set procname [lindex $skript 1]
    # always compute without leading ::
    set procname [string trimleft $procname :]

    if {[my withNamespace]} {
        set err 0
        set tail [namespace tail $procname]
        regexp "(.+)::$tail" $procname _ parent
        if {$tail eq $procname || ![info exists parent]
             || [my set name] ne $parent} {
            IDE::Dialog error "$procname is no proper proc name for this namespaced tcl group.\n Await somethink like [my set name]::$tail"
            return
        }
    }
    set pobj [IDE::TclProcsDescription getMethodFor $procname]
    if {[Object isobject $pobj] && [$pobj istype IDE::TclProcsDescription]} {
        if {[$pobj getGroupObj] ne [self]} {
            IDE::Dialog error "$procname is already defined in another tcl group.\n Can not redefine in this way"
        }
    } else {
        set pobj [my getProcObjForName $procname]
    }
    $pobj handleScript $skript
    return $procname
}

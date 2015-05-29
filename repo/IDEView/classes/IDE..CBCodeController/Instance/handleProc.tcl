IDE::CBCodeController instproc handleProc {script contentDesc} {
    if {[llength $script]!=4 || [lindex $script 0] ne "proc"} {
        IDE::Dialog error "To define new tcl proc give 4 elements list\n proc ?nameSpace::?procName arguments procBody"
        return
    }
    lassign $contentDesc class type method
    set procname [lindex $script 1]
    set pobj [IDE::TclProcsDescription getMethodFor $procname]
    if {$pobj eq "" || ![Object isobject $pobj]} {
        if {[IDE::XOIntroProxy getAbstractMethodType $type] eq "Procs"} {
            set groupObj $class
            set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
        } else {
            IDE::Dialog error "You need to select Procs Group to define new proc"
            return
        }
    } else {
        set groupObj [$pobj getGroupObj]
        set introProxy [$groupObj getIntroProxy]
    }
    $groupObj handleScript $script
    set editItem [$introProxy getItemFromScript $script]
    lset editItem 0 $groupObj
    lassign $editItem eclass etype emethod
    if {$etype ne $type || $emethod ne $method} {
        my showNavigation $editItem
        [my info parent] methodedit updateTitle $contentDesc $editItem
    } else {
        [my info parent] methodedit notifyNotEdited $contentDesc
    }
    return $editItem
}

IDE::CodeController instproc handleProc script {
    if {[llength $script]!=4 || [lindex $script 0] ne "proc"} {
        IDE::Dialog error "To define new tcl proc give 4 elements list\n proc ?nameSpace::?procName arguments procBody"
        return
    }
    set procname [lindex $script 1]
    set pobj [IDE::TclProcsDescription getMethodFor $procname]
    if {$pobj eq "" || ![Object isobject $pobj]} {
        IDE::Dialog error "It is not good place to define procs. Use component browser instead"
        return
    }
    [$pobj getGroupObj] handleScript $script
}

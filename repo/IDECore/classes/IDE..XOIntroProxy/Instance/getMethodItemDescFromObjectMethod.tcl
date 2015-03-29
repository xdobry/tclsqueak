IDE::XOIntroProxy instproc getMethodItemDescFromObjectMethod {object methodWithClass} {
    set def [$object procsearch [lindex $methodWithClass 0]]
    if {$def eq ""} {
        set type Instance
        set class [lindex $methodWithClass 1]
        set method [lindex $methodWithClass 0]]
    } else {
        set class [lindex $def 0]
        set dtype [lindex $def 1]
        set method [lindex $def 2]
        if {$dtype eq "instproc"} {
            if {[$class info instprocs $method] ne ""} {
                set type Instance
            } else {
                return
            }
        } else {
            set type Class
        }
    }
    list [string trimleft $class :] $type $method
}

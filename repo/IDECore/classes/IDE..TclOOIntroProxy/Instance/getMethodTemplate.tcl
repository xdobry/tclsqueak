IDE::TclOOIntroProxy instproc getMethodTemplate {class methodname type {margs args}} {
    if {$type eq "Procs"} {
        return "proc $methodname [list $margs] {\n    # enter the body hier\n}\n"
    } elseif {$type eq "Class"} {
        set proc oo::objdefine
    } else {
        set proc oo::define
    }
    return "$proc $class method $methodname [list $margs] {\n    # enter the body hier\n}\n"
}

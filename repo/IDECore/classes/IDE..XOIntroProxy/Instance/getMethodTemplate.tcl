IDE::XOIntroProxy instproc getMethodTemplate {class methodname type {margs args}} {
    if {$type eq "Procs"} {
        return "proc $methodname [list $margs] {\n    # enter the body hier\n}\n"
    } elseif {$type eq "Class"} {
        set proc proc
    } else {
        set proc instproc
    } 
    return "$class $proc $methodname [list $margs] {\n    # enter the body hier\n}\n"
}

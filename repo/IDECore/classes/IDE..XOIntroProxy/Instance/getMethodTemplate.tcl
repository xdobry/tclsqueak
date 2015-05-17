IDE::XOIntroProxy instproc getMethodTemplate {class methodname type {margs args}} {
    if {$type eq "Class"} {
        set proc proc
    } else {
        set proc instproc
    }
    return "$class $proc $methodname [list $margs] {\n    # enter the body hier\n}\n"
}

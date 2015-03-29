IDE::XOIntroProxy instproc getMethodTemplate {class methodname type} {
    if {$type eq "Class"} {
        set proc proc
    } else {
        set proc instproc
    }
    return "$class $proc $methodname {args} {\n    # enter the body hier\n}\n"
}

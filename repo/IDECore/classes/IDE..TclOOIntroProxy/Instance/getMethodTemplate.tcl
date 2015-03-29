IDE::TclOOIntroProxy instproc getMethodTemplate {class methodname type} {
    if {$type eq "Class"} {
        set proc oo::objdefine
    } else {
        set proc oo::define
    }
    return "$proc $class method $methodname {args} {\n    # enter the body hier\n}\n"
}

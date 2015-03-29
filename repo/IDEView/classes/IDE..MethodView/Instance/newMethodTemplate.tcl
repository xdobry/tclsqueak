IDE::MethodView instproc newMethodTemplate {} {
    my instvar vclass vtype
    set introProxy [my getIntroProxy]
    if {[Object isclass $vclass] && $vtype eq "Instance"} {
        set proc instproc
    } else {
        set proc proc
    }
    set procName [[my info parent]::methodedit getSelection]
    if {![regexp -- {\w+} $procName]} {
        set procName procName
    }
    if {$vtype eq "Procs"} {
        if {[$vclass withNamespace]} {
            set pre [$vclass getObjectName]::
        } else {
            set pre {}
        }
        set text "proc ${pre}$procName {args} {\n    # enter the body hier\n}\n"
        set start [string length "proc ${pre}"]
    } else {
        set text [$introProxy getMethodTemplate $vclass $procName $vtype]
        set start [string length "$vclass $proc "]
    }
    [my info parent]::methodedit setTextControler $text [self]
    [my info parent]::methodedit setSelection "2.4" "2.4 lineend"
    my prepareNewMethodState
}

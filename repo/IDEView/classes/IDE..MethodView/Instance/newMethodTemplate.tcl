IDE::MethodView instproc newMethodTemplate {} {
    my instvar vclass vtype
    set introProxy [my getIntroProxy]
    set procName [[my info parent]::methodedit getSelection]
    if {![regexp -- {\w+} $procName]} {
        set procName procName
    }
    if {$vtype eq "Procs"} {
        if {[$vclass withNamespace]} {
            set procName [$vclass getObjectName]::$procName
        }
    }
    set text [$introProxy getMethodTemplate $vclass $procName $vtype]
    [my info parent]::@codecontroller setCommentSourceFor "" $text $vclass [$introProxy getSpecialMethodType $vtype] $procName
    [my info parent]::methodedit setSelection "2.4" "2.4 lineend"
    my prepareNewMethodState
}

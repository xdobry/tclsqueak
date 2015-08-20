IDE::MethodView instproc invokeProcs actual {
    my instvar vclass vtype
    if {$vtype eq "Class"} {
        IDE::System invokeProc $vclass $actual [my getIntroProxy]
    } elseif {$vtype eq "Procs"} {
        IDE::System invokeTclProc $actual
    }
}

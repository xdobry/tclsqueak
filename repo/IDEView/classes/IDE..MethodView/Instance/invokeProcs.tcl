IDE::MethodView instproc invokeProcs actual {
    my instvar vclass vtype
    if {$vtype eq "Class"} {
        IDE::System invokeProc $vclass $actual
    } elseif {$vtype eq "Procs"} {
        IDE::System invokeTclProc $actual
    }
}

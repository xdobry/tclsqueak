IDE::ClassView instproc isProcWithNamespace {} {
    my instvar vtype vclass
    if {$vtype eq "Procs" &&
        [Object isobject $vclass] &&
        [$vclass istype IDE::ProcsGroup] &&
        [$vclass withNamespace]} {
        return 1
    }
    return 0
}

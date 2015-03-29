IDE::ClassView instproc isProcView {} {
    my instvar vtype vclass
    if {$vtype eq "Procs" &&
        [Object isobject $vclass] &&
        [$vclass istype IDE::ProcsGroup]} {
        return 1
    }
    return 0
}

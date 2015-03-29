IDE::ClassView instproc importUnknownFromNamespace actual {
    my instvar vclass
    if {![$vclass istype IDE::ProcsGroup] && ![$vclass withNamespace]} return
    if {![my canModifyComponent]} return
    $vclass importUnknownFromNamespace
}

IDE::ClassView instproc renameTclProcsGroup actual {
    my instvar vclass
    if {![$vclass istype IDE::ProcsGroup] && ![$vclass withNamespace]} return
    if {![my canModifyComponent]} return
    set newname [IDE::IDialogEntry getValue "Get new name for tcl proc group" [$vclass getObjectName]]
    if {$newname ne "" && $newname!=[$vclass getObjectName]} {
        $vclass rename $newname
        my refreshList
    }
}

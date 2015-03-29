IDE::Component instproc basicRemoveProcsGroup group {
    if {[$group info parent]!=[self]} {error "It is no my group"}
    $group unload
    $group destroy
}

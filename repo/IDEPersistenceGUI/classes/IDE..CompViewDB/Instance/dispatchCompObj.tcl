IDE::CompViewDB instproc dispatchCompObj procName {
    set actual [my selectedItem]
    if {$actual eq ""} {
        my upsMessage {select one component in vc for this action}
        return 
    }
    set cobj [IDE::Component getCompObjectForNameIfExist $actual] 
    if {$cobj eq "" || ![$cobj isPersistent]} {
        my upsMessage {selected component is not in version control}
        return
    }
    my $procName $cobj
}

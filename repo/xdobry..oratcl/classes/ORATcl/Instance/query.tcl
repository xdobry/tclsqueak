ORATcl instproc query statement {
    my instvar handle
    set qhandle [oraopen $handle]
    oraconfig $qhandle nullvalue {}
    if {[catch {set ret [orasql $qhandle $statement]} err]} {
        my errorMessage $err
        oraclose $qhandle
        return    
    }
    if {$ret==0} {
        return [ORATcl::SqlQuery new -childof [self] -qhandle $qhandle]
    } else {
        my errorMessage $ret
    }
    oraclose $qhandle
    return
}

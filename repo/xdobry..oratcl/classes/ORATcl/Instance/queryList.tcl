ORATcl instproc queryList statement {
    my instvar handle
    set qhandle [oraopen $handle]
    oraconfig $qhandle nullvalue {}
    # there are two error handling possible
    if {[catch {set ret [orasql $qhandle $statement]} err]} {
        my errorMessage $err
        oraclose $qhandle
        return    
    }
    if {$ret==0} {
        set ret [list]
        while {[orafetch $qhandle -datavariable row]==0} {
            lappend ret $row
        }
        oraclose $qhandle
        return $ret    
    } else {
        my errorMessage $ret
    }
    oraclose $qhandle
    return
}

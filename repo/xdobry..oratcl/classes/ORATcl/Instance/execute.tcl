ORATcl instproc execute statement {
    my instvar handle
    set qhandle [oraopen $handle]
    if {[oraparse $qhandle $statement]!=0} {
        oraclose $qhandle
        return
    }
    if {[catch {oraexec $qhandle} err]} {
        my errorMessage $err
        oraclose $qhandle
        return
    }
    set ret [oramsg $qhandle rows]
    oraclose $qhandle
    return $ret
}

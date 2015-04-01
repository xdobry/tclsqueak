PgSql instproc execute sqlstatement {
    my instvar sqlhandle insertid
    if {[catch {pg_execute $sqlhandle $sqlstatement} ret]} {
        my errorMessage $ret
        return
    }
    if {$ret eq ""} {set ret 0}
    return $ret
}

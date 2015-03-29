IDE::ProcsGroupPer instproc initFromDB {columns values methodid} {
    set id [lsearch $columns body]
    if {$id<0} { error "wrong table descriptor" }
    set body [lindex $values $id]
    set id [lsearch $columns type]
    if {$id<0} { error "wrong table descriptor" }
    set type [lindex $values $id]
    if {$type ne "tclproc"} {error "expect type tclproc. DB inconsistent"}
    set id [lsearch $columns name]
    if {$id<0} { error "wrong table descriptor" }
    set oname [lindex $values $id]

    if {![info complete $body] || [llength $body]!=4} { error {Tcl proc is not correct. DB corrupt or inconsistent}}

    set name [lindex $body 1]
    if {$name!=$oname} {error "name in tcl proc body different from in DB. $name!=$oname"}
     
    if {[my isTrackingOn]} {
        #set instance [my getForAnotherVersionMethod $name $methodid]
        # It happend if reload old deleted proc only form loadNameVersionId
        set instance [my createProcForName $name]
    } else {
        set instance [my createProcForName $name]
    }
    namespace eval :: $body
    return $instance
}

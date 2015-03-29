IDE::NoXOTclObjectMixin instproc initFromDB {columns values methodid} {
    if {[self calledclass] eq ""} { next } else {
        set id [lsearch $columns body]
        if {$id<0} { error "wrong table descriptor" }
        set body [lindex $values $id]
        set id [lsearch $columns type]
        if {$id<0} { error "wrong table descriptor" }
        set type [lindex $values $id]
        set id [lsearch $columns name]
        if {$id<0} { error "wrong table descriptor" }
        set name [lindex $values $id]
        if {![info complete $body]} { error {Method body is not complete. DB corrupt or inconsistent}}
        if {[my isTrackingOn]} {
            set instance [my getForAnotherVersion${type}Method $name $methodid]
        } else {
            set instance [my get${type}Method $name]
        }
        # TODO evaluate only in intro proxy
        namespace eval :: $body
        return $instance
    }
}

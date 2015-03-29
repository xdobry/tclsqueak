IDE::ObjectDescription instproc initFromDB {columns values methodid} {
    if {[self calledclass] eq ""} { next } else {
        set id [lsearch $columns body]
        if {$id<0} { error "wrong table descriptor" }
        set body [lindex $values $id]
        set id [lsearch $columns type]
        if {$id<0} { error "wrong table descriptor" }
        set type [lindex $values $id]
        if {![info complete $body] || [llength $body]<4} { error {Method body is not complete. DB corrupt or inconsistent}}
        set object [lindex $body 0]
        set createproc [lindex $body 1]
        set name [lindex $body 2]
        if {![Object isobject ${object}::description]} {
            error "Object '${object}::description' for this method do not exist. DB corrupt or inconsistent"
        }
        if {[my isTrackingOn]} {
            set instance [my getForAnotherVersion${type}Method $name $methodid]
        } else {
            set instance [my get${type}Method $name]
        }
        # pass the method to object
        $object $createproc $name [lindex $body 3] [lindex $body 4]
        return $instance
    }
}

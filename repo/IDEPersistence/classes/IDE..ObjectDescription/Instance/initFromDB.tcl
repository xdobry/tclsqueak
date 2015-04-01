IDE::ObjectDescription instproc initFromDB {columns values methodid} {
    if {[self calledclass] eq ""} { next } else {
        set body [IDE::DBPersistence getColumnValue $columns $values body]
        set type [IDE::DBPersistence getColumnValue $columns $values type]
        if {![info complete $body] || ([llength $body]<4 && $type ne "Def")} { error {Method body is not complete. DB corrupt or inconsistent}}
        lassign $body object createproc name
        if {$type ne "Def" && ![Object isobject ${object}::description]} {
            error "Object '${object}::description' for this method do not exist. DB corrupt or inconsistent"
        }
        if {[my isTrackingOn]} {
            set instance [my getForAnotherVersion${type}Method $name $methodid]
        } else {
            set instance [my get${type}Method $name]
        }
        $instance evalBody $body
        return $instance
    }
}

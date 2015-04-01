IDE::NoXOTclObjectMixin instproc initFromDB {columns values methodid} {
    if {[self calledclass] eq ""} { next } else {
        set body [IDE::DBPersistence getColumnValue $columns $values body]
        set type [IDE::DBPersistence getColumnValue $columns $values type]
        set name [IDE::DBPersistence getColumnValue $columns $values name]
        if {![info complete $body]} { error {Method body is not complete. DB corrupt or inconsistent}}
        if {[my isTrackingOn]} {
            set instance [my getForAnotherVersion${type}Method $name $methodid]
        } else {
            set instance [my get${type}Method $name]
        }
        $instance evalBody $body
        return $instance
    }
}

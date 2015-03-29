IDE::ObjectDescription proc initFromDB {columns values objectid} {
    set type [IDE::DBPersistence getColumnValue $columns $values type]
    if {$type eq "ProcsGroup"} {
        set name [IDE::DBPersistence getColumnValue $columns $values name]
        set defbody [IDE::DBPersistence getColumnValue $columns $values defbody]
        set inst [[my set loadingComponent] createTclProcsGroupByLoading $name [expr {$defbody ne ""}]]
        if {$defbody ne ""} {
            #eval proc namespace definition
            namespace eval :: $defbody
        }
        return $inst
    } else {
        set defbody [IDE::DBPersistence getColumnValue $columns $values defbody]
        set object [namespace eval :: $defbody]
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
        set desc [my createForObject $object]
        return $desc
    }
}

IDEStarter proc getObjectBody {objectid objName} {
    my instvar sqlhandle initializeList
    set body {}
    set rows [$sqlhandle queryList "SELECT Method.body,Method.category,Method.type,Method.name FROM ObjectMethod,Method where ObjectMethod.objectid=$objectid and ObjectMethod.methodid=Method.methodid"]
    foreach row $rows {
        set category [lindex $row 1]
        set type [lindex $row 2]
        set name [lindex $row 3]
        append body [lindex $row 0]
        if {$type eq "Class" && $name eq "initializeAfterLoad"} {
            lappend initializeList $objName
        }
    }
    return $body
}

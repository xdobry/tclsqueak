IDEStarter proc getComponentBody componentid {
    [self] instvar sqlhandle initializeList
    set initializeList {}
    set body {}
    set objects [$sqlhandle queryList "SELECT Object.objectid,Object.defbody,Object.metadata,Object.name FROM ComponentObject,Object where componentid=$componentid and ComponentObject.objectid=Object.objectid order by ComponentObject.deforder"]
    foreach row $objects {
        set id [lindex $row 0]
        set defbody [lindex $row 1]
        set metadata [lindex $row 2]
        set objName [lindex $row 3]
        # defbody eval return the object name
        append body $defbody
        if {$metadata ne ""} {
            append body $metadata
        }
        append body [my getObjectBody $id $objName]
    }
    #package provide $name 1
    foreach imethod $initializeList {
        append body "$imethod initializeAfterLoad\n"
    }
    return $body
}

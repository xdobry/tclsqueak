IDEStarter proc loadComponentFromMetakit {name {componentid newest}} {
    my instvar sqlhandle IDEdeveloping initializeList
    set initializeList {}
    set db [$sqlhandle set handle]
    if {$componentid eq "newest"} {
        set componentid [lindex [mk::select $db.Component -exact name $name] end]
        puts "newest component $name is $componentid"
    }
    foreach oid [mk::select $db.Component!$componentid.ComponentObject -sort deforder] {
        set id [mk::get $db.Component!$componentid.ComponentObject!$oid objectid]
        set row [mk::get $db.Object!$id defbody metadata name]
        set defbody [lindex $row 0]
        set metadata [lindex $row 1]
        set objName [lindex $row 2]
        # defbody eval return the object name
        set object [namespace eval :: $defbody]
        if {[my isDevelopingMode] && $object ne ""} {
            $object setMetadata component $name
        }
        if {$metadata ne ""} {
            eval $metadata
        }
        my loadObjectFromMetakit $id $objName $name
    }
    # !!! compute right version number
    package forget $name
    package provide $name 1
    foreach imethod $initializeList {
        if {[catch {$imethod initializeAfterLoad}]} {
            global errorInfo
            puts "Error by calling $imethod initializeAfterLoad $errorInfo"
        }
    }
}

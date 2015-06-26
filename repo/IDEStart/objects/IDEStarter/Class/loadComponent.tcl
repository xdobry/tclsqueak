IDEStarter proc loadComponent {name {componentid newest}} {
    my instvar sqlhandle initializeList
    if {[$sqlhandle istype XOMetakit]} {
        my loadComponentFromMetakit $name $componentid
        return
    }
    set initializeList {}
    if {$componentid eq "newest"} {
        set componentid [lindex [$sqlhandle queryList "select max(componentid) from Component where name='$name'"] 0]
        if {$componentid eq ""} {
            return 0
        }
        puts "newest component $name is $componentid"
    }
    set objects [$sqlhandle queryList "SELECT Object.objectid,Object.defbody,Object.metadata,Object.name FROM ComponentObject,Object where componentid=$componentid and ComponentObject.objectid=Object.objectid order by ComponentObject.deforder"]
    if {[llength $objects]==0} {
        return 0
    }
    puts "loading component $componentid $name"
    set objectForMetaData [list]
    foreach row $objects {
        set id [lindex $row 0]
        #puts "loading object $id"
        set defbody [lindex $row 1]
        set metadata [lindex $row 2]
        # fix for XOTcl 2.0
        if {[string range $metadata 0 3] eq "@ ::"} {
             regsub -all -lineanchor {^@ ::} $metadata {@ } metadata
        }
        set objName [lindex $row 3]
        # defbody eval return the object name
        set object [namespace eval :: $defbody]
        #puts "def $defbody"
        if {[my isDevelopingMode] && $object ne ""} {
            lappend objectForMetaData $object
        }
        if {$metadata ne ""} {
            #puts "meta $metadata"
            eval $metadata
        }
        my loadObject $id $objName $name
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
    if {[llength $objectForMetaData]>0} {
        set introProxy [IDE::XOIntroProxy getIntroProxy]
        foreach object $objectForMetaData {
            $introProxy setMetadataForObject $object component $name
        }
    }
    return 1
}

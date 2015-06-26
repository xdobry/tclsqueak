IDEStarter proc loadObjectFromMetakit {objectid objName compName} {
    my instvar sqlhandle initializeList tclmethodArr
    set db [$sqlhandle set handle]

    puts "load Class $objName"
    foreach mid [mk::select $db.Object!$objectid.ObjectMethod] {
        set methodid [mk::get $db.Object!$objectid.ObjectMethod!$mid methodid]
        set row [mk::get $db.Method!$methodid body category type name]
        set category [lindex $row 1]
        set type [lindex $row 2]
        set name [lindex $row 3]
        eval [lindex $row 0]
        if {$type eq "Class" && $name eq "initializeAfterLoad"} {
            lappend initializeList $objName
        }
        if {[my isDevelopingMode]} {
            if {$type eq "tclproc"} {
                set tclmethodArr($name) [list $compName $objName]
            }
            if {$category ne ""} {
                if {$type eq "Class"} {
                    my moveToCategoryBForObject $objName $name $category
                } elseif {$type eq "Instance"} {
                    my moveToCategoryBForObject $objName $name $category {}
                }
            }
        }
    }
}

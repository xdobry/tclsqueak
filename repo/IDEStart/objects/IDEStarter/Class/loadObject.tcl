IDEStarter proc loadObject {objectid objName compName} {
    my instvar sqlhandle IDEdeveloping initializeList tclmethodArr
    puts "load Class $objName"
    set rows [$sqlhandle queryList "SELECT Method.body,Method.category,Method.type,Method.name FROM ObjectMethod,Method where ObjectMethod.objectid=$objectid and ObjectMethod.methodid=Method.methodid"]
    foreach row $rows {
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

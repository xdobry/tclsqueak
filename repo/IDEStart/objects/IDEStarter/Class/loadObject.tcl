IDEStarter proc loadObject {objectid objName compName} {
    my instvar sqlhandle initializeList tclmethodArr
    puts "load Class $objName"
    set rows [$sqlhandle queryList "SELECT Method.body,Method.category,Method.type,Method.name FROM ObjectMethod,Method where ObjectMethod.objectid=$objectid and ObjectMethod.methodid=Method.methodid"]
    foreach row $rows {
        lassign $row body category type name
        if {$type ne "Def"} {
            namespace eval :: $body
        }
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

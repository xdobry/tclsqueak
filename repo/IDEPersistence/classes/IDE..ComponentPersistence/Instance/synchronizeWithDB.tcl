IDE::ComponentPersistence instproc synchronizeWithDB {} {
    my instvar componentid
    my setMaxIdForMyName
    my rereadAttributes {basedon versioninfo timest isclosed defcounter userid infoid}
    set rows [[my getPersistenceManager] selectSubobjects [self] {objectid deforder} {name type}]
    set indexes [list]
    set names [list]
    foreach row $rows {
        lappend indexes [lindex $row 0]
        lappend deforders [lindex $row 1]
        lappend names [lindex $row 2]
        lappend types [lindex $row 3]
    }
    set allObjects [concat [my getObjects] [my getClasses] [my getProcsGroups]]
    foreach id $indexes name $names deforder $deforders type $types {
        if {![ide::lremove allObjects $name]} {
            puts "Problem by synchronize $name ($type $id) not found in Component [my getName]"
        }
        if {$type eq "ProcsGroup"} {
            set gobj [my getProcsGroupWithName $name]
            if {$gobj eq ""} {
                puts stderr "Problem by synchronize group $name not found [my getName]"
            } else {
                IDE::ProcsGroupPer synchronize $gobj $id
                $gobj set deforder $deforder
            }
        } else {
            if {![Object isobject $name]} {
                puts stderr "Problem by synchronize $name not found."
            } else {
                set des [IDE::ObjectDescription createForObject $name]
                $des synchronizeWithId $id
                $des set deforder $deforder
            }
        }
    }
    if {[llength $allObjects]>0} {
        puts "Problem by synchronize $allObjects was not in DB"
    }
    my readRequiredFromDB
}

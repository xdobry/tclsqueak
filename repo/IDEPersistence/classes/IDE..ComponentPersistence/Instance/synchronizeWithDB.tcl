IDE::ComponentPersistence instproc synchronizeWithDB {} {
    my instvar componentid
    my setMaxIdForMyName
    my rereadAttributes {basedon versioninfo timest isclosed defcounter userid infoid}
    set rows [[my getPersistenceManager] selectSubobjects [self] {objectid deforder} {name type defbody}]
    set allObjects [concat [my getObjects] [my getClasses] [my getProcsGroups]]
    foreach row $rows {
        lassign $row id deforder name type defbody
        if {![ide::lremove allObjects $name]} {
            puts "Problem by synchronize $name ($type $id) not found in Component [my getName]"
        }
        if {$type eq "ProcsGroup"} {
            set gobj [my getProcsGroupWithName $name]
            if {$gobj eq ""} {
                puts "create group by synchronize $name in [my getName]"
                set gobj [my basicCreateTclProcsGroup $name [expr {$defbody ne ""}]]
            }
            IDE::ProcsGroupPer synchronize $gobj $id
            $gobj set deforder $deforder
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

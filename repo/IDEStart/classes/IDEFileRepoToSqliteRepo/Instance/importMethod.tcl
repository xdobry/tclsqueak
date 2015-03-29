IDEFileRepoToSqliteRepo instproc importMethod {objectid path objectname type} {
    my instvar fileRepo userid timestampFunction
    set meta [repobs::getMeta $fileRepo $path]
    set default [dict create comment {} version 0 body {}]
    set meta [dict merge $default $meta]
    set name [repobs::fileToCompName [lindex $path end]]
    set columns {name versioninfo type objectname body userid timest}
    set values [list $name [dict get $meta version] $type $objectname [dict get $meta body] $userid $timestampFunction]
    if {[dict get $meta comment] ne ""} {
        set infoid [my insertInfo [dict get $meta comment]]
        lappend columns infoid
        lappend values $infoid
    }
    if {[dict exists $meta category]} {
        lappend columns category
        lappend values [dict get $meta category]
    }
    set methodid [my insertTable Method $columns $values]
    my insertTable ObjectMethod {objectid methodid} [list $objectid $methodid]

}

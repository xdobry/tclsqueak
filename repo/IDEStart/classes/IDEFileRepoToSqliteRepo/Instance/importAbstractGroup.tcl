IDEFileRepoToSqliteRepo instproc importAbstractGroup {compid path type deforder} {
    my instvar fileRepo userid timestampFunction
    set meta [repobs::getMeta $fileRepo $path]
    set default [dict create comment {} version 0]
    set meta [dict merge $default $meta]

    set name [lindex $path end]
    set columns {name versioninfo type defbody userid timest isclosed}
    set values [list $name [dict get $meta version] $type [dict get $meta body] $userid $timestampFunction 1]
    if {[dict get $meta comment] ne ""} {
        set infoid [my insertInfo [dict get $meta comment]]
        lappend columns infoid
        lappend values $infoid
    }
    set objectid [my insertTable Object $columns $values]
    my insertTable ComponentObject {componentid objectid deforder} [list $compid $objectid $deforder]
    foreach type [repobs::getDirElems $fileRepo $path] {
        foreach method [repobs::getFileElems $fileRepo [concat $path $type] *.tcl] {
            my importMethod $objectid [concat $path $type $method] $name $type
        }
    }
}

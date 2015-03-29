IDEFileRepoToSqliteRepo instproc importComponent comp {
    my instvar fileRepo userid timestampFunction connection
    set meta [repobs::getMeta $fileRepo $comp]
    set default [dict create ootype XOTcl comment {} required {} version 0]
    set meta [dict merge $default $meta]
    set columns {name versioninfo defcounter userid timest isclosed}
    set values [list $comp [dict get $meta version] 0 $userid $timestampFunction 1]
    if {[dict get $meta comment] ne ""} {
        set infoid [my insertInfo [dict get $meta comment]]
        lappend columns infoid
        lappend values $infoid
    }
    set compid [my insertTable Component $columns $values]
    set deforder 0

    foreach class [repobs::getDirElems $fileRepo [list $comp classes]] {
        my importAbstractGroup $compid [list $comp classes $class] Class $deforder
        incr deforder
    }
    foreach object [repobs::getDirElems $fileRepo [list $comp objects]] {
        my importAbstractGroup $compid [list $comp objects $object] Object $deforder
        incr deforder
    }
    foreach class [repobs::getDirElems $fileRepo [list $comp procs]] {
        my importAbstractGroup $compid [list $comp procs $class] ProcsGroup $deforder
        incr deforder
    }
    if {[dict exists $meta required]} {
        foreach req [dict get $meta required] {
            lassign $req package version
            # TODO package version column
            my insertTable ComponentRequire {componentid name} [list $compid $package]
        }
    }
    $connection execute "update Component set defcounter=$deforder where componentid=$compid"
}

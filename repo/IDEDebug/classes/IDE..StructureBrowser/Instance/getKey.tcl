IDE::StructureBrowser instproc getKey key {
    my instvar type content
    if {$type eq "dict"} {
        set value [dict get $content $key]
    } else {
        set value [lindex $content $key]
    }
    return $value
}

XOMetakit instproc getTables {} {
    my instvar handle
    set tables [list]
    foreach t [mk::view info $handle] {
        lappend tables [lindex [split $t :] 0]
    }
    return $tables
}

ODBC instproc getSequence table {
   my instvar sequenceCache
    if {![info exists sequenceCache($table)]} {
        set newid [my getSequenceFromDB $table 10]
        set sequenceCache($table) [list $newid 10]
        return $newid
    }
    set key $sequenceCache($table)
    set lastid [expr {[lindex $key 0]+1}]
    set count [lindex $key 1]
    if {$count<=1} {
        set newid [my getSequenceFromDB $table 10]
        set sequenceCache($table) [list $newid 10]
        return $newid
    }
    set sequenceCache($table) [list $lastid [expr {$count-1}]]
    return $lastid
}

IDE::DBInfo instproc readCommentFromDB {} {
    my instvar infoid
    if {[info exists infoid] && $infoid ne "" && $infoid!=0} {
        my set comment [lindex [[my getPersistenceManager] selectExact Info infotext infoid $infoid] 0]
    }
}

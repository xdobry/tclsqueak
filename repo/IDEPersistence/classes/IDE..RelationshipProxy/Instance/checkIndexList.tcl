IDE::RelationshipProxy instproc checkIndexList {} {
    my instvar objectList indexList
    if {![my exists indexList]} {
        set objectList {}
        set indexList [[my relMapping] getIndexListForSourceId [[my getSourceInstance] getIdValue]]
        set tClass [[my relMapping] targetClass]
        set desc ${tClass}::descriptor 
        foreach elem $indexList {
            set tid [lindex $elem 0]
            lappend objectList [$desc createInstanceFromDB $tClass $tid]
        }
    }
}

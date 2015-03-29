IDE::RepositoryImporter instproc getDesc desc {
    my instvar desc_arr
    if {![info exists desc_arr($desc)]} {
        set ndesc [IDE::DBMapping new -childof [self] -table [$desc table] -idColumn [$desc idColumn]]
        set desc_arr($desc) $ndesc
        foreach column [$desc set columns] {
            $ndesc addColumn [lrange $column 0 1]
        }
    }
    return $desc_arr($desc)
}

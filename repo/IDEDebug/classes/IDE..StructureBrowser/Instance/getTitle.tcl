IDE::StructureBrowser instproc getTitle {} {
    my instvar type
    if {$type eq "dict"} {
        return Dict
    } elseif {$type eq "list"} {
        return List
    }
}

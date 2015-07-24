IDE::StructureBrowser instproc getKeyElemName {} {
    my instvar type
    if {$type eq "list"} {
        return Element
    } else {
        next
    }
}

IDE::StructureBrowser instproc setKey {key value} {
    my instvar type content
    if {$type eq "dict"} {
        dict set content $key $value
    } else {
        lset content $key $value
    }
    my updateVarContent
    return $value
}

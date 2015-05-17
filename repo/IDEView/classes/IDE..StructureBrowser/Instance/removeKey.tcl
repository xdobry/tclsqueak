IDE::StructureBrowser instproc removeKey key {
    my instvar content type
    if {$type eq "dict"} {
        set content [dict remove $content $key]
        [self]::keys removeItem $key
    } elseif {$type eq "list"} {
        set content [lreplace $content $key $key]
        [self]::keys removeItemAt [expr {[llength $content]}]
    }
    my updateVarContent
}

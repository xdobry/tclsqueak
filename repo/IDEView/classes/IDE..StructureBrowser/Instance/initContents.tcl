IDE::StructureBrowser instproc initContents {} {
    my instvar vobject ovar type content
    set content [my getVarContent]
    if {$type eq "dict"} {
        set keys [dict keys $content]
        [self]::keys setList $keys
    } elseif {$type eq "list"} {
        set l [llength $content]
        set keys [list]
        for {set i 0} {$i<$l} {incr i} {
            lappend keys $i
        }
        [self]::keys setListUnsorted $keys
    } else {
        error "unknown type $type"
    }
}

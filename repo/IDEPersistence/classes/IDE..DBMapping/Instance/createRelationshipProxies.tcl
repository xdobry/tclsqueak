IDE::DBMapping instproc createRelationshipProxies instance {
    if {![my exists relationships]} return
    foreach rel [my set relationships] {
        if {[Object isobject ${instance}::[$rel name]]} return
        IDE::RelationshipProxy create [$instance]::[$rel name] -relMapping $rel
    }
}

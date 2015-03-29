IDE::DBMapping instproc initInstance {class cols values id} {
    my instvar idColumn
    set instance [$class initFromDB $cols $values $id]
    my fillValues $instance $values
    $instance set $idColumn $id
    my createRelationshipProxies $instance
    return $instance
}

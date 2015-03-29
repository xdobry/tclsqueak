IDE::NoXOTclObjectMixin instproc getObjectName {} {
    my instvar object
    return [string trimleft $object :]
}

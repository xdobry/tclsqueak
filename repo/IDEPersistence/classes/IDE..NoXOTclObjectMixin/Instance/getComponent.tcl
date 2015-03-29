IDE::NoXOTclObjectMixin instproc getComponent {} {
    my instvar introProxy object
    $introProxy getCompObjectFor $object
}

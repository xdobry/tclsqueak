IDE::VarsView instproc addToReadTrace actual {
    my instvar vobject vtype
    $vobject requireNamespace
    IDE::VarsTracker addTrace ${vobject}::${actual} read
}

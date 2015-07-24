IDE::VarsView instproc addToWatch actual {
    my instvar vobject vtype
    $vobject requireNamespace
    IDE::VarsTracker addTrace ${vobject}::${actual} watch
}

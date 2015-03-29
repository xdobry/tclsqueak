IDE::VarsView instproc addToWriteTrace actual {
    my instvar vobject vtype
    $vobject requireNamespace
    IDE::VarsTracker addTrace ${vobject}::${actual} write
}

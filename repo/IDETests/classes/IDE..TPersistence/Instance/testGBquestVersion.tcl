IDE::TPersistence instproc testGBquestVersion {} {
    my instvar compObj methodArr
    $compObj setObjectsArray objArr
    foreach obj [array names objArr] {
        my assert {[[$compObj getObject $obj] isclosed]}
    }
    my assert {[$compObj isclosed]}
}

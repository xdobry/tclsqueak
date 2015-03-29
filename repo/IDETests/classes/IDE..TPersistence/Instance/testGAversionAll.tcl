IDE::TPersistence instproc testGAversionAll {} {
    my instvar compObj methodArr
    foreach obj [$compObj getClasses] {
          [$compObj getObject $obj] versionEdition
    }
    foreach obj [$compObj getObjects] {
          [$compObj getObject $obj] versionEdition
    }
    foreach obj [$compObj getProcsGroupsObjects] {
          $obj versionEdition
    }
    $compObj versionEdition
}

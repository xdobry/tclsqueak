IDE::ConfigMapTestNoGUI instproc testEGUnloadComponents {} {
    my instvar confmap cwrap cobj
    foreach obj [$cobj getClasses] {
          [$cobj getObject $obj] versionEdition
    }
    foreach obj [$cobj getObjects] {
          [$cobj getObject $obj] versionEdition
    }
    foreach obj [$cobj getProcsGroupsObjects] {
          $obj versionEdition
    }
    $cobj versionEdition
    $cobj unload
    my assert {[IDE::Component getCompObjectForNameIfExist TestCase] eq ""}
    my assert {![$cwrap isActualLoaded]}
    $cwrap refreshData
    my assert {[$cwrap isclosed]}
    my assert {[$confmap canVersion]}
}

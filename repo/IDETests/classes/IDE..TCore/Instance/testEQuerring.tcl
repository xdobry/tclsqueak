IDE::TCore instproc testEQuerring {} {
    my instvar obj
    if {[$obj getObjectDefineList] eq ""} { error "no define list"}
    $obj getRequiredFor
    $obj getRequiredFrom
    if {[$obj getVersionNumber] ne "0.1"} { error "false version number"}
    $obj getVisibleClasses
    if {[$obj isPersistent]} { error "should be not persistant"}
    $obj asScript
    $obj getClassesHierarchy
    $obj computeRequirements
    $obj getRequiredFromDeep
    $obj standardFileName
    $obj standardFileNameBase
}

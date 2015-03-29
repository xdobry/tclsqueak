IDE::TCore instproc testKQuerring {} {
    my instvar obj
    $obj getObjectDefineList
    $obj getRequiredFor
    $obj getRequiredFrom
    if {[$obj getVersionNumber] ne "0.1"} { error "false version number"}
    $obj getVisibleClasses
    if {[$obj isPersistent]} { error "should be not persistant"}
    $obj asScript
}

IDE::TCore instproc testIRemoveObjects {} {
    my instvar obj
    $obj removeClass TestA
    if {[ide::lcontain [$obj getClasses] TestA]} {error "removing false"}
    if {![ide::lcontain [$obj getClasses] TestB]} {error "removing false"}
    $obj removeObject TestC
    if {[ide::lcontain [$obj getObjects] TestC]} {error "removing false"}
    $obj removeClass TestB
    if {[ide::lcontain [$obj getClasses] TestB]} {error "removing false"}
    TestA destroy
    TestB destroy
    TestC destroy
    IDE::CommentsContainer destroyObject ::TestB
}

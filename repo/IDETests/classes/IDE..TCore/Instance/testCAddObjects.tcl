IDE::TCore instproc testCAddObjects {} {
    my instvar obj
    my addSampleObjects $obj
    my checkSampleObjects $obj
    if {[$obj getObjects] ne "TestC"} {error "adding false1"}
    if {![ide::lcontain [$obj getClasses] TestA]} {error "adding false2"}
    if {![ide::lcontain [$obj getClasses] TestB]} {error "adding false3"}
    if {[llength [$obj getClasses]]!=2} {error "adding false4"}
}

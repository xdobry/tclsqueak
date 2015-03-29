IDE::TImportingSource instproc testFImportSource {} {
    my instvar cobj
    IDE::Component importCompsFromFile [my getFileName]
    set cobj [IDE::Component getCompObjectForNameIfExist TestCase]
    my assert {$cobj ne ""}
    my checkSampleObjects $cobj

    set classes [$cobj getClasses]
    my assert {[ide::lcontain $classes MetaTestClass]}
    my assert {[ide::lcontain $classes MTest]}

    set group [$cobj getProcsGroupWithName default]
    my assert {$group ne ""}
    my assert {![$group withNamespace]}
    my assert {[lsearch [$group getProcsNames] "testProc"]>=0}
    my assert {[info proc ::testProc] ne ""}
}

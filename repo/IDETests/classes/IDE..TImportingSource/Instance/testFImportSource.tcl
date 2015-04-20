IDE::TImportingSource instproc testFImportSource {} {
    my instvar cobj
    IDE::Component importCompsFromFile [my getFileName]
    set cobj [IDE::Component getCompObjectForNameIfExist TestCase]
    my assert {$cobj ne ""}
    my checkSampleObjects $cobj

    set classes [$cobj getClasses]
    my assert {"MetaTestClass" in $classes}
    my assert {"MTest" in $classes}

    set group [$cobj getProcsGroupWithName default]
    my assert {$group ne ""}
    my assert {![$group withNamespace]}
    my assert {"testProc" in [$group getProcsNames]}
    my assert {[info proc ::testProc] ne ""}
}

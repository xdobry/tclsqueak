IDE::TOOIntroProxy instproc testBTclOOProxyObject {} {
    my instvar tclass tobject
    my createSampleClass
    set p [IDE::TclOOIntroProxy getIntroProxy]
    set inst [$tclass new 1]

    my assert {[$p isObject $inst]}
    my assert {[$p isObjectClass $tclass]}
    my assert {[$p getClassForObject $inst] eq [namespace which $tclass]}
    my assert {[$p getMethodParamDescForObject $inst foo] ne ""}
    my assert {[llength [$p getDetailedObjectMethods $inst All 0 0 0]]>0}

    $inst foo 1 2
    my assert {[$inst foo 1 2] eq "1"}
    my assert {"pa" in [$p getVarsForObject $inst]}
    my assert {[$inst eval set pa] eq "1"}

    $inst destroy
    $tclass destroy
}

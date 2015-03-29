IDE::TCore instproc testEObjectQuerring {} {
    my instvar obj
    set introProxy [my getIntroProxy]
    if {[$introProxy getCategoriesBForObject TestC] eq ""}  { error {category error1}}
    if {[$introProxy getComponentNameForObject TestC] ne "TestCase"} { error {component1}}
    if {[$introProxy getCompObjectFor TestC] ne $obj} { error {component2}}
    $introProxy getSubobjectsHierarchyForObject TestC
    $introProxy metadataAsScriptForObject TestC
    $introProxy metadataAsScriptPurForObject TestC

}

IDE::TCore instproc testHMoveClass {} {
    my instvar obj mcobj
    set mcobj [IDE::Component getCompObjectForName TestCase2]
    namespace eval :: {
         Class TestD
         TestA instproc dm1 {} { puts dm1_test }
         TestA instproc dm2 {} { puts dm2_test }
    }
    set group [$mcobj createTclProcsGroup testTclGroup3 0]
    $group handleScript {proc testProcM2 {} {puts testProc}}

    my assert {[$mcobj getProcsGroupWithName testTclGroup3]==$group}
    $group moveToComponent TestCase
    my assert {[set group [$obj getProcsGroupWithName testTclGroup3]] ne ""}
    my assert {[$group getComponent]==$obj}
    my assert {[$mcobj getProcsGroupWithName testTclGroup3] eq ""}

    set introProxy [my getIntroProxy]
    $introProxy moveToComponent TestD TestCase
    my assert {[$introProxy getComponentNameForObject TestD] eq "TestCase"}
    my assert {[$introProxy getCompObjectFor TestD] eq $obj}

    $introProxy moveToComponent TestD TestCase2
    my assert {[$introProxy getComponentNameForObject TestD] eq "TestCase2"}
    my assert {[$introProxy getCompObjectFor TestD] eq $mcobj}
    my assert {[ide::lcontain [$mcobj getClasses] TestD]}
    my assert {![ide::lcontain [$obj getClasses] TestD]}
}

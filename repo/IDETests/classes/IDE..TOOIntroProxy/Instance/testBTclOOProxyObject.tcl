IDE::TOOIntroProxy instproc testBTclOOProxyObject {} {
    set p [IDE::TclOOIntroProxy getOOIntroProxy]
    set tclass TclOOTest
    if {![info object isa object $tclass]} {
        oo::class create $tclass {
            method foo {p1 p2} {
                my variable a
                set a $p1
                return 1
            }
            method foo2 {} {
                my variable a
                return $a
            }
            self method bar {pa} {
                my variable a
                set a $pa
                return bar
            }
        }
    }
    set inst [$tclass new]

    my assert {[$p isObject $inst]}
    my assert {[$p isObjectClass $tclass]}
    my assert {[$p getClassForObject $inst] eq "::IDE::TclOOTest"}
    my assert {[$p getMethodParamDescForObject $inst foo] ne ""}
    my assert {[llength [$p getDetailedObjectMethods $inst All 0 0 0]]>0}

    $inst foo 1 2
    my assert {[$inst foo2] eq "1"}
    my assert {"a" in [$p getVarsForObject $inst]}
    my assert {[$inst eval set a] eq "1"}

    $inst destroy
    $tclass destroy
}

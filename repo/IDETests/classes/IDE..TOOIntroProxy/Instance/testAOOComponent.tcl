IDE::TOOIntroProxy instproc testAOOComponent {} {
    set tclass TclOOTest
    if {![info object isa object $tclass]} {
        oo::class create $tclass {
            method foo {a b} {
                return 1
            }
            self method bar {a} {
                return bar
            }
        }
    }
    set comp [IDE::Component getCompObjectForName testoocomp TclOO]
    set ip [$comp getIntroProxy]
    $ip moveToComponent $tclass testoocomp
    my assert {[$ip hasclass IDE::TclOOIntroProxy]}
    $comp asScript
    $comp getClassesHierarchy
    my assert {$tclass in [$comp getClasses]}
    my assert {$tclass in [$comp getVisibleClasses]}

    set c [$ip getCompObjectFor $tclass]
    my assert {$c ne "" && $comp eq $c}


    $comp unload
}

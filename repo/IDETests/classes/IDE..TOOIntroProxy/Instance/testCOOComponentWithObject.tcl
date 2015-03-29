IDE::TOOIntroProxy instproc testCOOComponentWithObject {} {
    set tclass ::TclOOTest
    set tobject ::TclOOObject
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
    if {![info object isa object $tobject]} {
        oo::object create $tobject
        oo::objdefine $tobject method foo {a} {
            return 1
        }
    }

    set comp [IDE::Component getCompObjectForName testoocomp TclOO]
    set ip [$comp getIntroProxy]
    $ip moveToComponent $tclass testoocomp
    $ip moveToComponent $tobject testoocomp

    my assert {[$ip hasclass IDE::TclOOIntroProxy]}
    $comp asScript
    $comp getClassesHierarchy
    set tclassn [string trimleft $tclass :]
    set tobjectn [string trimleft $tobject :]
    my assert {$tclassn in [$comp getClasses]}
    my assert {$tclassn in [$comp getVisibleClasses]}

    set c [$ip getCompObjectFor $tclass]
    my assert {$c ne "" && $comp eq $c}

    set c [$ip getCompObjectFor $tclass]
    my assert {$c ne "" && $comp eq $c}

    my assert {$tobjectn in [$comp getObjects]}

    set c [$ip getCompObjectFor $tobject]
    my assert {$c ne "" && $comp eq $c}
    my assert {"foo" in [$ip getClassMethods $tobject]}

    $comp unload

    my assert {![info object isa object $tclass]}
    my assert {![info object isa object $tobject]}
}

IDE::TOOIntroProxy instproc testCOOComponentWithObject {} {
    my instvar tclass tobject
    my createSampleClass
    my createSampleObject

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

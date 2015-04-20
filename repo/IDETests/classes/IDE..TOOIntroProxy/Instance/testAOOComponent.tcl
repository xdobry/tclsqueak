IDE::TOOIntroProxy instproc testAOOComponent {} {
    my instvar tclass tobject tcompname
    my createSampleClass
    set comp [IDE::Component getCompObjectForName $tcompname TclOO]
    set ip [$comp getIntroProxy]
    $ip moveToComponent $tclass $tcompname
    my assert {[$ip hasclass IDE::TclOOIntroProxy]}
    $comp asScript
    $comp getClassesHierarchy
    my assert {$tclass in [$comp getClasses]}
    my assert {$tclass in [$comp getVisibleClasses]}

    set c [$ip getCompObjectFor $tclass]
    my assert {$c ne "" && $comp eq $c}


    $comp unload
}

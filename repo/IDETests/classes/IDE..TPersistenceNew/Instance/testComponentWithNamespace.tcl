IDE::TPersistenceNew instproc testComponentWithNamespace {} {
    my instvar compName className className2

    set testns ::testns
    set className ${testns}::$className
    set className2 ${testns}::$className2

    set compObject [IDE::Component getCompObjectForName $compName XOTcl $testns]
    set introProxy [$compObject getIntroProxy]

    my assert {[$compObject getNamespace] eq $testns}

    Class $className
    Class $className2
    $className instproc m1 {} { puts test }

    $introProxy moveToComponent $className $compName
    $introProxy moveToComponent $className2 $compName

    set script [$compObject asScript]
    my assert {[string find "namespace eval" $script]>=0}

    return

    IDE::ComponentPersistence importComponent $compName

    set desc [$introProxy getDescriptionForObject $className]
    set bodyDesc [$desc getDefMethod]
    set m1 [$bodyDesc getIdValue]

    $className parameter par1
    set m2 [$bodyDesc getIdValue]
    my assert {$m1 != $m2}

    set oldSuperClasss [$className info superclass]
    $className superclass $className2

    set m3 [$bodyDesc getIdValue]
    my assert {$m2 != $m3}

    my assert {[llength [$desc getVersionsForName [$bodyDesc getName]]]==3}

    $desc loadVersionId $m2
    my assert {[::$className info superclass] eq $oldSuperClasss}

    $compObject unload

    set versions [IDE::ComponentPersistence getVersionsForName $compName]
    my assert {[llength $versions]==1}
    IDE::ComponentPersistence loadVersionId [lindex $versions 0 0]

    my assert {[$className info superclass] eq $oldSuperClasss}

}

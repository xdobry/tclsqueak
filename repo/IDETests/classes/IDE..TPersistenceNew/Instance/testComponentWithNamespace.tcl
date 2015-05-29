IDE::TPersistenceNew instproc testComponentWithNamespace {} {
    my instvar compName className className2

    set testns ::testns
    set className ${testns}::$className
    set className2 ${testns}::$className2

    set compObject [IDE::Component createCompObjectForName $compName XOTcl $testns]
    set introProxy [$compObject getIntroProxy]
    
    Class $className
    Class $className2
    $className instproc m1 {} { puts test }

    $introProxy moveToComponent $className $compName
    $introProxy moveToComponent $className2 $compName

    set script [$compObject asScript]
    my assert {[string first "namespace eval" $script]>=0}

    IDE::ComponentPersistence importComponent $compName

    $compObject unload

    set versions [IDE::ComponentPersistence getVersionsForName $compName]
    my assert {[llength $versions]==1}
    IDE::ComponentPersistence loadVersionId [lindex $versions 0 0]

    set compObject [IDE::Component getCompObjectForNameIfExist $compName]
    my assert {$compObject ne ""}
    my assert {[$compObject getNamespace] eq $testns}
    
    my endTest
    
}

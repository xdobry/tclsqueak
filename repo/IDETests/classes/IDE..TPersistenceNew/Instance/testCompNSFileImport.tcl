IDE::TPersistenceNew instproc testCompNSFileImport {} {
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

    set fileName [my getFileName]
    $compObject saveAsScript [my getFileName]

    $compObject unload
    namespace delete $testns
    
    my assert {[file isfile $fileName]}
    my assert {[IDE::Component getCompObjectForNameIfExist $compName] eq ""}
    
    IDE::Component importCompsFromFile [my getFileName]
    set cobj [IDE::Component getCompObjectForNameIfExist $compName]
    
    my assert {$cobj ne ""}
    my assert {[$cobj getNamespace] eq $testns}
    
    
    my endTest
    
}

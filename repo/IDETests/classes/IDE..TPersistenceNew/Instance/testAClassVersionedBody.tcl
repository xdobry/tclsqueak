IDE::TPersistenceNew instproc testAClassVersionedBody {} {
     my instvar compName className className2
     my initNames

     set compObject [IDE::Component getCompObjectForName $compName]
     set introProxy [$compObject getIntroProxy]

     Class create ::$className
     Class create ::$className2
     ::$className instproc m1 {} { puts test }

     $introProxy moveToComponent $className $compName
     $introProxy moveToComponent $className2 $compName

     IDE::ComponentPersistence importComponent $compName

     set desc [$introProxy getDescriptionForObject $className]
     set bodyDesc [$desc getDefMethod]
     set m1 [$bodyDesc getIdValue]

     ::$className parameter par1
     set m2 [$bodyDesc getIdValue]
     my assert {$m1 != $m2}

     set oldSuperClasss [::$className info superclass]
     ::$className superclass $className2

     set m3 [$bodyDesc getIdValue]
     my assert {$m2 != $m3}

     my assert {[llength [$desc getVersionsForName [$bodyDesc getName]]]==3}

     $desc loadVersionId $m2
     my assert {[::$className info superclass] eq $oldSuperClasss}

     $compObject unload

     set versions [IDE::ComponentPersistence getVersionsForName $compName]
     my assert {[llength $versions]==1}
     IDE::ComponentPersistence loadVersionId [lindex $versions 0 0]

     my assert {[::$className info superclass] eq $oldSuperClasss}
     
     my endTest

}

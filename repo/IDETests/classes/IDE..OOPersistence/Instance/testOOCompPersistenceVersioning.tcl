IDE::OOPersistence instproc testOOCompPersistenceVersioning {} {
    if {![IDE::System isDatabase]} return

    set tclass TclOOTest
    set tclass2 TclOOTest2
    set tobject TclOOObject
    set compName testoocomp
    if {![info object isa object $tclass]} {
        namespace eval :: {oo::class create TclOOTest {
            method foo {a b} {
                return 1
            }
            method foo1 {a b} {
                return 1
            }
            self method bar {a} {
                return bar
            }
        }}
    }
    if {![info object isa object $tobject]} {
        namespace eval :: {
            oo::object create TclOOObject
            oo::objdefine TclOOObject method foo {a} {
                return 1
            }
        }
    }
    set comp [IDE::Component getCompObjectForName $compName TclOO]
    set ip [$comp getIntroProxy]
    $ip moveToComponent $tclass $compName
    $ip moveToComponent $tobject $compName

    IDE::ComponentPersistence importComponent $compName

    $ip handleScript {
        oo::define TclOOTest method foo {a b} {
            # version 2
            return 2
        }
    }

    set desc [$ip getDescriptionForObject $tclass]
    set mdesc [$desc getInstanceMethodIfExist foo]
    my assert {$mdesc ne ""}
    my assert {[llength [$desc getVersionsForName foo]]==2}

    foreach obj [concat [$comp getObjects] [$comp getClasses] [$comp getProcsGroupsObjects]] {
        [$ip getDescriptionForObject $obj] versionEdition
    }

    $comp versionEdition
    set id1 [$comp getIdValue]
    $comp createNewEdition
    set id2 [$comp getIdValue]
    my assert {$id1!=$id2}

    my assert {[llength [IDE::ComponentPersistence getVersionsForName $compName]]==2}

    $ip handleScript {
        oo::define TclOOTest method foo {a b} {
            # version 3
            return 3
        }
    }
    $ip handleScript {
        oo::define TclOOTest method foo2 {a b} {
            return 1
        }
    }
    $ip deleteMethodForObject $tclass foo1 Instance

    if {![info object isa object $tclass2]} {
        namespace eval :: {oo::class create TclOOTest2 {
            method foo {a b} {
                return 1
            }
            self method bar {a} {
                return bar
            }
        }}
    }

    $ip moveToComponent $tclass2 $compName

    $comp rereadForAnotherVersion $id1

    my assert {![$ip isObjectClass $tclass2]}
    set foobody [$ip getBodyInstanceMethod $tclass foo]
    my assert {[string first "version 2" $foobody]>0}
    my assert {[$ip getBodyInstanceMethodIfExist $tclass foo2] eq ""}

    IDE::ComponentPersistence removeForEver $compName
}

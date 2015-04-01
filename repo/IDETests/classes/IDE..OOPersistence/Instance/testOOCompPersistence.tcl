IDE::OOPersistence instproc testOOCompPersistence {} {
    if {![IDE::System isDatabase]} return

    set tclass TclOOTest
    set tobject TclOOObject
    set compName testoocomp
    if {![info object isa object $tclass]} {
        namespace eval :: {oo::class create TclOOTest {
            method foo {a b} {
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
    $ip setCommentForObject $tclass "class comment"
    $ip setMethodCommentForObject $tclass Instance foo "method foo comment"

    IDE::ComponentPersistence importComponent $compName
    $comp unload
    my assert {![info object isa object $tclass]}
    my assert {![info object isa object $tobject]}

    set versions [IDE::ComponentPersistence getVersionsForName $compName]
    my assert {[llength $versions]==1}
    IDE::ComponentPersistence loadVersionId [lindex $versions 0 0]
    my assert {[info object isa object $tclass]}
    set comp [IDE::Component getCompObjectForNameIfExist $compName]
    my assert {$comp ne ""}
    my assert {[$comp getOOType] eq "TclOO"}
    my assert {$tclass in [$comp getClasses]}
    my assert {$tobject in [$comp getObjects]}
    my assert {[$ip getCommentForObject $tclass] eq "class comment"}
    $comp unload

    IDE::ComponentPersistence removeForEver $compName
}

IDE::TOOIntroProxy instproc createSampleClass {} {
    my instvar tclass

    if {![info object isa object $tclass]} {
        namespace eval :: [list oo::class create $tclass {
            method foo {a b} {
                return 1
            }
            self method bar {a} {
                return bar
            }
            constructor {a} {
                my variable pa
                set pa $a
            }
            destructor {
                puts dest
            }
        }]
    }
}

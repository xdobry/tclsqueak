IDE::TOOIntroProxy instproc createSampleObject {} {
    my instvar tobject
    if {![info object isa object $tobject]} {
        namespace eval :: [list oo::object create $tobject]
        namespace eval :: [list oo::objdefine $tobject method foo {a} {
            return 1
        }]
    }
}

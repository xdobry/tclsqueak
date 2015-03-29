IDE::TPersistence instproc testFAAddObjects {} {
    my instvar compObj
    set introProxy [$compObj getIntroProxy]
    namespace eval :: {
         Class TestD
         TestD instproc m1 {} { puts test }
         TestD instproc m2 {} { puts test }
    }
    $introProxy moveToComponent TestD TestCase
    my assert {[ide::lcontain [$compObj getClasses] TestD]}
}

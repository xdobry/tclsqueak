IDE::TPersistence instproc testFMComponent2 {} {
    my instvar compObj2 compObj

    set compObj2 [IDE::Component getCompObjectForName TestCase2]
    IDE::ComponentPersistence importComponent [$compObj2 getName]

    namespace eval :: {
         Class TestM
         TestM instproc md1 {} { puts test }
         TestM instproc md2 {} { puts test }
    }
    set introProxy [$compObj getIntroProxy]
    $introProxy moveToComponent TestM TestCase
    my assert {[ide::lcontain [$compObj getClasses] TestM]}
    my assert {[$introProxy getComponentNameForObject TestM] eq "TestCase"}

    # Move Class to another persistent Component

    $introProxy moveToComponent TestM TestCase2
    my assert {![ide::lcontain [$compObj getClasses] TestM]}
    my assert {[ide::lcontain [$compObj2 getClasses] TestM]}
    my assert {[$introProxy getComponentNameForObject TestM] eq "TestCase2"}

    $compObj2 copyClassOrObject TestM TestMCopy
    my assert {[ide::lcontain [$compObj2 getClasses] TestMCopy]}
    my assert {[$introProxy getComponentNameForObject TestMCopy] eq "TestCase2"}

    set met [TestMCopy info instprocs]
    my assert {[ide::lcontain $met md1]}
    my assert {[ide::lcontain $met md2]}
}

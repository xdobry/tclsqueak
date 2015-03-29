IDE::TPersistence instproc testGCNewComponentEdition {} {
    my instvar compObj
    set oldid [$compObj set componentid]
    set introProxy [$compObj getIntroProxy]
    $compObj createNewEdition
    my assert {$oldid!=[$compObj set componentid]}
    my assert {$oldid==[$compObj set basedon]}
    # adding new class
    namespace eval :: {
         Class TestE
         TestE instproc m1 {} { puts test }
         TestE instproc m2 {} { puts test }
    }
    $introProxy moveToComponent TestE TestCase
    my assert {[ide::lcontain [$compObj getClasses] TestE]}

    # removing class
    $compObj removeClass TestB
    TestB destroy
    my assert {![ide::lcontain [$compObj getClasses] TestB]}

    # modifing class
    namespace eval :: {
         TestA instproc s1 {} { puts test }
         TestA instproc m2 {} {}
    }
}

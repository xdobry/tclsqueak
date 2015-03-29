IDE::TParser instproc testLArrays {} {
   # check for array parsing
   my initTestClass
   set script {TestA instproc t1 {a b} {
            set a(1) b
            puts $a(3)
            set b 1
            puts $a($b)
            puts $a(abc.[my set b])
            puts $a([my set b])m
            puts www$a(2)
            puts $a(2)www
            set d(3) 2
            puts $d(3)
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {![$context hasErrors]}

    set script {TestA instproc t11 {a b} {
            puts $a([my noSuchProc])
            puts $a($c)
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[$context hasErrors]}
    my assert {[llength [$context errors]]==2}
}

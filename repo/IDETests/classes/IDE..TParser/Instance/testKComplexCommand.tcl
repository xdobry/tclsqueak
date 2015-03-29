IDE::TParser instproc testKComplexCommand {} {
   # check for foreach regexp ans switch parsing/evaluating
   my initTestClass
   set script {TestA instproc t1 {a b} {
            regexp -- {[ab]+} {abder} a b c
            set a; set b
            for {set x 1} {$x<3} {incr x} {
                set d 0
            }
            set d; set x;
            foreach e {a b c} f {g h i} {
                puts "$e $f"
            }
            set e; set f
            foreach i {a b c} {
                puts $i
            }
            set i
            foreach {j k} {a b c} {
                puts "$j $k"
            }
            set j; set k
            switch $j {
                a { set m 0}
                b { set m 0}
            }
            set m
            upvar $a ad $b ae
            set ad; set ae;
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {![$context hasErrors]}
}

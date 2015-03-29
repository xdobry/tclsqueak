IDE::TScriptParsing instproc testGComplexExpr {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a b} {
            set c "$a were [set k 2]"
            puts "c$c"
            ${a}::test test
            puts ewrr$a
            puts wqwr
            set e $c.teststring
            foreach d $a {
                puts ${k}
            }
            for {set m 0} {$m<10} {incr m} {
                puts $m
            }
            set a
            set e g[set k]
            set a $a[set a]
    }}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

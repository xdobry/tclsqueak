IDE::TScriptParsing instproc testDSwitchListNegativeOne {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a my
        switch -- $a {
            a {sete res a}
            b {set reb b}
            default {set res default}
        }
    }
    my assert {[llength [$context set errors]]==1} [$context set errors]
}

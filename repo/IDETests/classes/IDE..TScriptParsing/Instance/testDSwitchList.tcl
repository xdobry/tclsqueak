IDE::TScriptParsing instproc testDSwitchList {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a my
        switch -- $a a {
            set res a
        } b {
            set res b
        } default {
            set res default
        }
        switch -- $a {
            a {set res a}
            b {set reb b}
            default {set res default}
        }
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

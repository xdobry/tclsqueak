IDE::TScriptParsing instproc testDSwitchListNegativeList {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a my
        switch -- $a a {
            set res a
        } b {
            unknown
        } default {
            set res default
        }
    }
    my assert {[llength [$context set errors]]==1} [$context set errors]
}

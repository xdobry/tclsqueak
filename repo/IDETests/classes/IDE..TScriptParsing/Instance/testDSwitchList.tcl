IDE::TScriptParsing instproc testDSwitchList {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a my
        swich -- $a a {
            set res a
        } b {
            set res b
        } default {
            set res default
        }
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

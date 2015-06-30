IDE::TScriptParsing instproc testGContextGlobalVars {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a 1
        after 10 {puts $a}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

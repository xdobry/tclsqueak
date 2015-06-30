IDE::TScriptParsing instproc testDEvalGlobalContextVars {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a my
        eval {puts $a}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

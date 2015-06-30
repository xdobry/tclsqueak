IDE::TScriptParsing instproc testBCExpRealWithPointOnly {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set a [expr {1.}]
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

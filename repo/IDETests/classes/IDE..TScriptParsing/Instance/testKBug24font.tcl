IDE::TScriptParsing instproc testKBug24font {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        font metrics tempf
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

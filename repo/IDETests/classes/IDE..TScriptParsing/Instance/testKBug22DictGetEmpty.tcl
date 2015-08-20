IDE::TScriptParsing instproc testKBug22DictGetEmpty {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        dict get {1 2}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

IDE::TScriptParsing instproc testKBug25 {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        package vsatisfies [package present Ttk] 8-8.5.9
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

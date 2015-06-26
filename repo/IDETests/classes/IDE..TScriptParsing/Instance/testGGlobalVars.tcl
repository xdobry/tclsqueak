IDE::TScriptParsing instproc testGGlobalVars {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        list $tcl_version $env(HOME) $tcl_platform(2)
        set auto_path
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

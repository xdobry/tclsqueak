IDE::TScriptParsing instproc testKBug21Rand {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set r [expr {int(rand()*256)}]
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

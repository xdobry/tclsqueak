IDE::TScriptParsing instproc testDWrongFileSubcommand {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set ae yes
        set p [file parent $ae]
    }
    my assert {[llength [$context set errors]]>0} [$context set errors]
}

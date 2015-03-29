IDE::TScriptParsing instproc testBCExpEqEmpty {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
    if {$a ne ""} {
        $a foo
    }
}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

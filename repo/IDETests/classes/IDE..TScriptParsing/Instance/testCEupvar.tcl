IDE::TScriptParsing instproc testCEupvar {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
    upvar $a abb
    incr abb
    }
    proc bar {} {
        foo a
        return $a
    }
    }

    my assert {[llength [$context set errors]]==0} [$context set errors]
}

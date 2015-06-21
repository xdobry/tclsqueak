IDE::TclOOCheckerTest instproc testATclOOMyVariable {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    method foo {} {
        my variable v1
        puts $v1
    }
    method bar {} {
        puts $v1
    }
}


    }
    my assert {[llength [$context set errors]]>0} [$context set errors]
}

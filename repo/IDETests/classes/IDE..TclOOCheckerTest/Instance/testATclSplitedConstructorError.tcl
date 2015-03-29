IDE::TclOOCheckerTest instproc testATclSplitedConstructorError {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    self method bar2 {} { puts bar2 }
}

oo::define fruit constructor {} {
    my variable a
    set3 a [expr {2+2}]
}

    }
    my assert {[llength [$context set errors]]>0} [$context set errors]
}

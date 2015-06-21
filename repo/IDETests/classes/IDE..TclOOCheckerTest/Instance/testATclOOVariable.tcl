IDE::TclOOCheckerTest instproc testATclOOVariable {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    variable v1
    method foo {} {
        puts $v1
    }
    method bar {} {
        puts $v1
    }
}


    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

IDE::TclOOCheckerTest instproc testBclasscalls {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create c
oo::objdefine c {
    method bar {} {
        puts bar
    }
    method foo {} {
        my notexists
    }
    method ree {} {
        my bar
    }
}

    }
    my assert {[llength [$context set errors]]==1} [$context set errors]
}

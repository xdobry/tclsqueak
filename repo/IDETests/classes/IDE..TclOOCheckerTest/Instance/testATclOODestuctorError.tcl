IDE::TclOOCheckerTest instproc testATclOODestuctorError {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    method eat {} {
        puts "yummy!"
    }
    destructor {
        unknownProc
    }
}


    }
    my assert {[llength [$context set errors]]>0} [$context set errors]
}

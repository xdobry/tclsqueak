IDE::TclOOCheckerTest instproc testATclOOConstructorError {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    method eat {} {
        puts "yummy!"
    }
    constructor {par1 par2} {
        unknownProc
    }
}


    }
    my assert {[llength [$context set errors]]>0} [$context set errors]
}

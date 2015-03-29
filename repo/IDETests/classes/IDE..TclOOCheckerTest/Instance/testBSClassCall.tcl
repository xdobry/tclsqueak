IDE::TclOOCheckerTest instproc testBSClassCall {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    method eat {} {
        puts "yummy!"
    }
}
oo::class create banana {
    superclass fruit
    constructor {} {
        my variable peeled
        set peeled 0
    }
    method peel {} {
        my eat
    }
}
set b [banana new]
$b eat

    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

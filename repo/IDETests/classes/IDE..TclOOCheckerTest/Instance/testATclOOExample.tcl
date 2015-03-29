IDE::TclOOCheckerTest instproc testATclOOExample {} {
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
        my variable peeled
        set peeled 1
        puts "skin now off"
    }
    method edible? {} {
        my variable peeled
        return $peeled
    }
    method eat {} {
        if {![my edible?]} {
            my peel
        }
        next
    }
}
set b [banana new]
$b eat

    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

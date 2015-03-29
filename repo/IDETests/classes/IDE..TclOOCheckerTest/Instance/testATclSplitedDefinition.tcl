IDE::TclOOCheckerTest instproc testATclSplitedDefinition {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    variable v1
    method foo {} {
        puts $v1
    }
    forward Foo my foo
    export foo
    unexport foo
    mixin Test
    self {
        method bar {} {
            puts bar
        }
    }
    self method bar2 {} {
       my variable cv
       set cv 2
       puts bar2
    }
}

oo::define fruit method bar {} {
    puts bar
}
oo::define fruit constructor {} {
    my variable a
    set a [expr {2+2}]
}
oo::objdefine fruit method cfoo {} {
    my variable c
    set c 23
}

    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

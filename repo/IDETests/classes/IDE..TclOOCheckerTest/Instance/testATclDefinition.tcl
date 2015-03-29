IDE::TclOOCheckerTest instproc testATclDefinition {} {
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
    self method bar2 {} { puts bar2 }
}


    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

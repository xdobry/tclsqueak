IDE::TclOOCheckerTest instproc testATclOOSubobjectsNegative {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create sub {
    method foo {} {
        
    }
}
oo::class create fruit {
    method foo {} {
        sub create mysub
    }
    method bar {} {
        mysub foo 1
    }
}

    }
    set repository [[$context set repository] getWriteRepository]
    my assert {[$repository getXotclClassForObject mysub] eq ""} {mysub should not be global object}
    my assert {[$repository getVariableType ::fruit subobject mysub] eq "::sub"}
    my assert {[llength [$context set errors]]>0} [$context set errors]
}

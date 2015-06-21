IDE::TclOOCheckerTest instproc testBClassMethodCall {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    self method f1 {} {
        return 1
    }
    method f2 {} {
        return 2
    }
}
oo::objdefine fruit method foo {} {
    return 1
}
fruit foo
fruit f1

    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

IDE::TclOOCheckerTest instproc testBTclOOExampleWInnerCall {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit {
    method eat {} {
        puts "yummy!"
    }
    method foo {} {
        my eatUnknown
    }
}

    }
    my assert {[llength [$context set errors]]>0} [$context set errors]
}

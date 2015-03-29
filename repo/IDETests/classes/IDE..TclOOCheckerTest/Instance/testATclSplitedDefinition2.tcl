IDE::TclOOCheckerTest instproc testATclSplitedDefinition2 {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO

oo::class create fruit

oo::define fruit {
    method bar {} {puts bar}
    method bar2 {} {puts bar2}
}

set f [fruit new]
$f bar
$f bar2

    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

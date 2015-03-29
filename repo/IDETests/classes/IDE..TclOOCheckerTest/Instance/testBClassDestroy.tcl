IDE::TclOOCheckerTest instproc testBClassDestroy {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO
oo::class create fruit {
   method foo {} {
       my variable a
       set a 21
   }
}
fruit destroy
}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

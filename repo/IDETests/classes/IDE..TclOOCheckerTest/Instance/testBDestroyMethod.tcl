IDE::TclOOCheckerTest instproc testBDestroyMethod {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO
oo::class create fruit {
   destructor {
       puts "destructing"
   }
}
}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

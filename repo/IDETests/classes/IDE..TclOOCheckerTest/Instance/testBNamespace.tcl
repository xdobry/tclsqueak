IDE::TclOOCheckerTest instproc testBNamespace {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
package require TclOO
namespace eval mns {
oo::class create fruit {
   method foo {} {
       my variable a
       set a 21
   }
}
fruit create myfruit
myfruit foo

}
}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}

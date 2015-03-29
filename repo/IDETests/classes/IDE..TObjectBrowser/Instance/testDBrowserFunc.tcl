IDE::TObjectBrowser instproc testDBrowserFunc {} {
   my instvar obj
   ${obj}::varsview selectItem varFoo
   ${obj}::subobjectsview selectItem subObject
   ${obj}::methodview selectItem foo
   update idletasks
}

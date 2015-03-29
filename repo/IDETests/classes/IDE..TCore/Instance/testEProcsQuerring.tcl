IDE::TCore instproc testEProcsQuerring {} {
   my instvar obj
   set tclgroup [$obj getProcsGroupWithName testTclGroup]
   my assert {[$tclgroup getDescription]==$tclgroup}
   my assert {![$tclgroup isPersistent]}
   my assert {[$tclgroup getComponentName] eq "TestCase"}
   
   set tclgroupNS [$obj getProcsGroupWithName testNamespace]
   my assert {[$tclgroupNS withNamespace]}
   
   set pobj [$tclgroup getProcObjForNameIfExist ::testProc]
   my assert {$pobj ne ""}
   my assert {![$pobj isPersistent]}
}

IDE::ExampleTest instproc testAName args {
   my instvar a
   set a test
   set comp [IDE::Component getCompObjectForNameIfExist IDECore]
   $comp getClasses
   if {[Object isobject IDE::ExtendedDebugger]} {
       atk::halt
   } else {
       my halt
   }
}

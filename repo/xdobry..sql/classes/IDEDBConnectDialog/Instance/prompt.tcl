IDEDBConnectDialog instproc prompt {} {
   my instvar userAction
   wm deiconify [my set win]
   set userAction _
   my getInterface
   if {$userAction eq "cancel"} {
	my cleanUpAfterSignal
	return
   }
   my getConnectionArguments
   my cleanUpAfterSignal
   if {$userAction eq "cancel"} return
   return  [my connectArgs]
}

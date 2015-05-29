IDE::MethodEditSynchronizatorMix instproc getKeyFromBody script {
   my instvar vctype vclass
   if {$vctype eq "Component"} {
       return [list $vclass $vctype {}]
   }
   set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vctype]
   if {$introProxy ne ""} {
       $introProxy getItemFromScript $script
   } else {
       return ""
   }
}

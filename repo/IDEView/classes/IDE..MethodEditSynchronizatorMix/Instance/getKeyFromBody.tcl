IDE::MethodEditSynchronizatorMix instproc getKeyFromBody script {
   my instvar vctype
   set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vctype]
   $introProxy getItemFromScript $script
}

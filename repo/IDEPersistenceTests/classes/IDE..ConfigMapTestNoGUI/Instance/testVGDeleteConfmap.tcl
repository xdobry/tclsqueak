IDE::ConfigMapTestNoGUI instproc testVGDeleteConfmap {} {
   my instvar cobj
   $cobj unload
   IDE::ComponentPersistence removeForEver TestCase
}

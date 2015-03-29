IDE::PlugInsManager proc loadExtras extra {
   my instvar plugInsArr plugInsList
   if {$extra ni $plugInsList} {
       error "$extra is not registered plug in"
   }
   foreach {Name Label Component Startscript DepPlugInsList} $plugInsArr($extra) {}
   foreach dep $DepPlugInsList {my loadExtras $dep}
   IDE::SystemConfigMap loadComponentFromAny $Component
   namespace eval :: $Startscript
}

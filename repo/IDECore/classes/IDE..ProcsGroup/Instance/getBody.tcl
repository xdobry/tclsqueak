IDE::ProcsGroup instproc getBody {{nometa 0}} {
   set script "[my getDefBody]\n"
   if {!$nometa && [my hasComment]} {
       append script "@ tclgroup [my getObjectName] idemeta comment [list [[my getComponent] getName]] [list [my getComment]]\n"
   }
   foreach pname [lsort [my getProcsNames]] {
       set obj [my getProcObjForName $pname]
       if {!$nometa} {
           append script [$obj getMetaBody]
       }
       append script [$obj getBody]
   }
   return $script
}

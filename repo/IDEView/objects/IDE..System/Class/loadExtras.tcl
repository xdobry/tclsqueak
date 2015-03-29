IDE::System proc loadExtras extra {
   if {$extra eq "sqlDebuger"} {
       if {[IDE::SystemConfigMap loadComponentFromAny xdobry::sqlDebug]} {
          SqlDebugger debug
       }
   } elseif {$extra eq "Configuration"} {
       if {[IDE::SystemConfigMap loadComponentFromAny IDEConfiguration]} {
           IDE::ConfigmapBrowser newBrowser
       }
   } else {
       IDE::Dialog error "$extra is unknown"
   }
}

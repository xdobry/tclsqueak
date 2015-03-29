IDE::InstallerGUI instproc checkSqlParam args {
   my instvar paramFrame connection createDB
   set args [$paramFrame getConnectArgs]
   if {$createDB} {
       set dbArgname [$connection getDatabaseArgumentName]
       set cargs {}
       foreach {key value} $args {
           if {$key==$dbArgname} {
               set dbname $value
           } else {
               lappend cargs $key $value
           }
       }
       puts "cargs $cargs"
       $connection connect $cargs
       $connection createDatabase $dbname
   } else {
       $connection connect $args
   }
   return [my installTables]
}

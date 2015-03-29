IDE::InstallerGUI instproc checkMysqlLibLocation {} {
   [self] instvar usepackage libfile
   global errorInfo
   if {$usepackage} {
      if {[catch {package require mysqltcl}]} {
         [self] installError "Error $errorInfo by loading package mysqltcl"
         return 0
      }
   } else {
      set libfile [[self]::libfile getValue]
      if {![file exists $libfile]} {
         [self] installError "Could not find $libfile"
         return 0
      }
      if {[catch {load $libfile}]} {
         [self] installError "Error $errorInfo by loading library $libfile"
         return 0
      }
   }
   return 1
}

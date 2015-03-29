MySql proc initializeInterface {{prefs package}} {
   global errorInfo

   if {$prefs eq "package"} {
       if {![catch {package require mysqltcl}]} return
       puts stderr "can not load package mysqltcl $errorInfo"
       set prefs /usr/lib/mysqltcl/libmysqltcl.so
   }
   if {[catch "load $prefs"]} {
       puts stderr "can not load library $prefs $errorInfo"
   }
}

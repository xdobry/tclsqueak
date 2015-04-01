PgSql proc initializeInterface {{prefs package}} {
   global errorInfo
   if {$prefs eq "package"} {
       if {![catch {package require Pgtcl}]} return
       puts stderr "can not load package PgSql $errorInfo"
       set prefs /usr/lib/libpgtcl.so
   }
   if {[catch {load $prefs}]} {
       puts stderr "can not load library $prefs $errorInfo"
   }
}

Sqlite proc initializeInterface {{prefs package}} {
   if { $prefs eq "package" } {
       if {![catch {package require sqlite}]} return
       if {![catch {package require tclsqlite}]} return
       if {![catch {package require sqlite3}]} {
           if {[info commands sqlite] eq "" && [info commands sqlite3] ne ""} {
               interp alias {} sqlite {} sqlite3
           }
           return
       }
       set prefs tclsqlite[info sharedlibextension]
   }
   if {[catch {load $prefs} err]} {
       puts stderr "can not load library $prefs: $err"
   }
}

IDE::TkWindowControler instproc invokeMenu args {
   my instvar win
   set startwin $win.mb
   set i 0
   foreach item $args {
       incr i
       set index [$startwin index $item]
       if {$i<[llength $args]} {
           set startwin [$startwin entrycget $index -menu]
       }
   }
   $startwin invoke $index
}

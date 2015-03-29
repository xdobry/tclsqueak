IDE::FontChooser instproc validateSize value {
   set ret [expr {![catch {expr {$value+0}}]}]
   if {$ret} {
       my changeSize
   }
   return $ret
}

IDE::TclModeEdit instproc showRefButton tags {
   foreach t $tags {
      if {[string index $t 0] eq "d"} {
          my showRefTag $t
          return
      }
   }
}

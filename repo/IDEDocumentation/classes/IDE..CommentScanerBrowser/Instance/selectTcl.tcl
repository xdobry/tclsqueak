IDE::CommentScanerBrowser instproc selectTcl {} {
   set list [[self]::files getList]
   set index 0
   foreach item $list {
       if {[string match *.tcl $item] || [string match *.xotcl $item]} {
           [self]::files addSelection $index $index
       }
       incr index
   }
}

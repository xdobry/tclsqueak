IDE::WikiReapMixin instproc preamble {title url now updated} {
     my output "#####"
     my output "#"
     my output "# \"$title\""
     my output "# [string map [list mini.net/tcl wiki.tcl.tk] $url]"
     my output "#"
     my output "# Tcl code harvested on:  $now GMT"
     my output "# Wiki page last updated: $updated"
     my output "#"
     my output "#####"
     my output \n
 }

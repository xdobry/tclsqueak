proc repobs::packageUnknownHandler {original name args} {
   variable repodir
   set pdir [file join $repodir [asFileName $name]]
   puts "loading $name"
   if {[file isdirectory $pdir]} {
        package ifneeded $name 1.0 [list repobs::loadComponent $name $repodir]
        return
   } else {
       puts "can not load $name fallback $original"
       if {[llength $original]} {
           uplevel 1 $original [::linsert $args 0 $name]
       }
   }
}

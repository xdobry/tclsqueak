IDE::SqlBrowser proc newBrowser {} {
     if {![IDE::System isTkNeverThan84]} {
       IDE::Dialog error "You need at least Tcl8.4 for use SQL Browser. Upgrade please!"
       return
     }
     if {![my initTkTable]} {
         IDE::Dialog error "The package Tktable could not be loaded please install it on your tcl system (see http://sourceforge.net/projects/tktable)"
         
     } else {
         my new [Object autoname .sqlbrowser]
     }
}

IDE::TkWinInspectorBrowser proc newBrowser {} {
   if {![IDE::System isTkNeverThan84]} {
       IDE::Dialog error "You need at least Tcl8.4 for use Tk Inspector. Upgrade please!"
       return
   }
   return [my new [Object autoname .tkinspector]]
}

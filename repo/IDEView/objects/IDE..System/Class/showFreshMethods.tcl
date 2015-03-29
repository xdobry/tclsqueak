IDE::System proc showFreshMethods {} {
   set list [ide::lcollect each [IDE::MethodDescription getFreshInserted] {
        $each printStringShort}]
   if {[llength $list]==0} {
       IDE::Dialog message "No fresh-inserted methods"
       return
   }
   IDE::MethodBrowser newBrowserList $list fresh-inserted
}

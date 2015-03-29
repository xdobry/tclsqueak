IDE::BreakpointListView instproc refreshList args {
   my instvar breakpointsList
   set breakpointsList [IDE::BreakpointFasade getAllBreakpoints]
   set blist {}
   foreach bhandle $breakpointsList {
       lappend blist [$bhandle displayName]
   }
   my setListUnsorted $blist
   [[self] info parent]::methodedit makeEmpty
}

IDE::BreakpointEdit instproc destroy {} {
   if {[my breakpoint] ne ""} {
       [my breakpoint] removeInterestFrom [self]
   }
   next
}

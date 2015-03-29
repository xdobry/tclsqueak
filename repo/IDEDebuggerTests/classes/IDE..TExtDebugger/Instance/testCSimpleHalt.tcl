IDE::TExtDebugger instproc testCSimpleHalt args {
   set a b
   set b 0
   incr b
   atk::halt
   incr b
   foreach a {1 2 3 4} {
       set b $a
   }
   set a $b
   
}

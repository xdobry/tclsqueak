IDE::TestCase instproc shouldStop {} {
   my instvar testMode
   expr {$testMode ne "force"}
}

IDE::ProgEdit instproc doubleButton {} {
   if {![my set useEditMode]} return
   set twin [my getTextWindow]
   set iindex [$twin index insert]
   set index [$twin index {insert - 1 c}]
   set bc [$twin get $index $iindex]
   set bindex [string first $bc "\{\[(\"" 0]
   if {$bindex>=0} {
       set cb [string index "\}\])\"" $bindex]
       if {$bc eq "\""} {
          set endindex [my searchCloseQuote [$twin get $index end]]
       } else {
          set endindex [my searchCloseBrace [$twin get $index end] $bc $cb]
       }
       if {$endindex!=-1} {
          $twin tag remove sel 1.0 end
          $twin tag add sel $index "$iindex + $endindex c"
          return 1
       }
   }
   set bindex [string first $bc "\}\]" 0]
   if {$bindex>=0} {
       set cb [string index "\{\[" $bindex]
       set endindex [my searchOpenBrace [$twin get 1.0 $iindex] $bc $cb]
       if {$endindex!=-1} {
          $twin tag remove sel 1.0 end
          $twin tag add sel "$iindex - $endindex c" $iindex
          return 1
       }
   }
   return 0
}

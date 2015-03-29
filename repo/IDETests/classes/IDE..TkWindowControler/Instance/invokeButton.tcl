IDE::TkWindowControler instproc invokeButton {name {browser {}}} {
   if {$browser eq ""} {
       set swin [my set win]
   } else {
       set swin [$browser set win]
   }
   set button [my searchButton $swin $name]
   $button invoke
}

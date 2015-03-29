IDE::DBVCUtils instproc testCAviableClasses {} {
   my instvar compBrowser
   ${compBrowser}::appview setSelectedItem IDECore
   my invokeMenu Class {Version Control} Available
   set browser [lindex [IDE::VersionBrowser info instances] 0]
   my assert {$browser ne ""}
   update idletasks
   ${browser}::available setSelectedItem IDE::Component
   update idletasks
   ${browser}::version setSelectedIndex 0
   update idletasks

   # Chek View Button (Edition Browser)
   my invokeButton View $browser
   set ebrowser [lindex [IDE::EditionBrowser info instances] 0]
   my assert {$ebrowser ne ""}
   update idletasks
   ${ebrowser}::methods setSelectedItem addClass
   update idletasks
   $ebrowser destroy

   my invokeButton Cancel $browser
   update idletasks
}

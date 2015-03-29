IDE::DBVCUtils instproc testEClassInfo {} {
   my instvar compBrowser
   return
   ${compBrowser}::appview setSelectedItem IDECore
   ${compBrowser}::classview setSelectedItem IDE::Component
   my invokeMenu Class {Version Control} Info
   my closeInfo
}

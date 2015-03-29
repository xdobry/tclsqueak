IDE::DBVCUtils instproc testEComponentInfo {} {
   my instvar compBrowser
   return
   ${compBrowser}::appview setSelectedItem IDECore
   my invokeMenu Component {Version Control} Info
   my closeInfo
}

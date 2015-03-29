IDE::DBVCUtils instproc testEMethodInfo {} {
   my instvar compBrowser
   return
   ${compBrowser}::appview setSelectedItem IDECore
   ${compBrowser}::classview setSelectedItem IDE::Component
   ${compBrowser}::methodcatview setSelectedItem _all_categories
   ${compBrowser}::methodview setSelectedItem addClass
   my invokeMenu Method {Version Control} Info
   my closeInfo
}

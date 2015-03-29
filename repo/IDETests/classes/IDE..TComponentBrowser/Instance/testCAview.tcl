IDE::TComponentBrowser instproc testCAview {} {
   my instvar obj
   ${obj}::appview selectItem IDECore
   ${obj}::classview selectItem IDE::Component
   ${obj}::methodcatview::stateButton setState Instance
   update idletasks
   ${obj}::methodcatview changeViewType Instance
   ${obj}::methodcatview selectItem _all_categories
   ${obj}::methodview selectItem addClass

   ${obj}::methodcatview::stateButton setState Class
   update idletasks
   ${obj}::methodcatview changeViewType Class
   ${obj}::methodcatview selectItem _all_categories
   ${obj}::methodview selectItem getCompObjectForName

   ${obj}::classview changeViewType Objects
   ${obj}::classview selectItem IDE::IntroProxy
   update idletasks
   ${obj}::methodcatview changeViewType Class
   ${obj}::methodcatview selectItem _all_categories
   ${obj}::methodview selectItem getClasses
   update idletasks
   ${obj}::classview changeViewType "Procs"
   update idletasks
}

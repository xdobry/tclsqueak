IDE::TComponentBrowser instproc testCAview {} {
   my instvar obj
   $obj refreshHItem {IDECore Component {}}
   update idletasks
   
   $obj refreshHItem {IDE::Component Def IDECore}
   update idletasks
   
   $obj refreshHItem {IDE::Component Instance asScript}
   update idletasks

}

IDE::TComponentBrowser instproc startTest {} {
   my instvar obj
   set obj [IDE::CompBrowser newBrowser]
   update idletasks
   return 1
}

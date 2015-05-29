IDE::TDevelopUtils instproc testASearch args {
   IDE::MethodBrowser searchSendersAll testASearch
   IDE::MethodBrowser searchTextAll mySpecialText23
   IDE::MethodBrowser searchImplementorsAll testASearch 1
   IDE::MethodBrowser searchImplementorsComponent testASearch IDETests
   set introProxy [IDE::XOIntroProxy getIntroProxy]
   IDE::MethodBrowser searchTextClass testASearch IDE::TDevelopUtils testASearch $introProxy
   IDE::MethodBrowser searchImplementorsClass testASearch IDE::TDevelopUtils $introProxy

   IDE::MethodBrowser searchImplementorsAll testASearch 1
   IDE::MethodBrowser searchImplementorsComponent testASearch IDETests
   IDE::MethodBrowser searchImplementorsClass testASearch IDE::TDevelopUtils $introProxy

   update idletasks
   foreach obj [IDE::MethodBrowser info instances] {
      $obj destroy
      update idletasks
   }
}

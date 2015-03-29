IDE::TDevelopUtils instproc testBSearchProc args {
    set introProxy [IDE::XOIntroProxy getIntroProxy]

   IDE::MethodBrowser searchImplementorsAll testFindMethodUUHA 1
   IDE::MethodBrowser searchImplementorsComponent testFindMethodUUHA IDETests
   IDE::MethodBrowser searchImplementorsClass testFindMethodUUHA IDE::TDevelopUtils $introProxy
   IDE::MethodBrowser searchTextAll RybnikNowiny
   IDE::MethodBrowser searchTextComponent RybnikNowiny IDETests
   IDE::MethodBrowser searchTextClass RybnikNowiny IDE::TDevelopUtils RybnikNowiny $introProxy

   my assert {[IDE::MethodSelector getMethodsForPattern testBSearchProc] ne ""}
   my assert {[IDE::MethodSelector getMethodsForPattern testFindMethodUUHA] ne ""}

   update idletasks
   foreach obj [IDE::MethodBrowser info instances] {
      $obj destroy
      update idletasks
   }
}

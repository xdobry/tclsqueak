IDE::ConfigmapControler proc versionCMapEdition cmap {
   if {[$cmap canVersion]} {
       $cmap versionEdition
   }
}

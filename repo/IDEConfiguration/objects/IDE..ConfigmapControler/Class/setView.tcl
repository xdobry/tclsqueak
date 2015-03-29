IDE::ConfigmapControler proc setView tview {
   my instvar view configmapGroups
   my set selectedVersion {}
   my setActions 
   set view $tview
   ${view}::names actionHandler [self]
   ${view}::names nameMethod name
   ${view}::names addEventInteres [self] selectGroup selectedObject
   
   ${view}::versions actionHandler [self]
   ${view}::versions nameMethod versionDisplay
   ${view}::versions addEventInteres [self] selectVersion selectedObject

   ${view}::components actionHandler [self]
   ${view}::components isMarkedMethod isActualLoaded
   ${view}::components nameMethod nameVersion
   
   ${view}::cmaps actionHandler [self]
   ${view}::cmaps nameMethod nameVersion


   $view addEventInteres [self] changeViewType changeViewType
   my set viewType Comment

   my initConfigmaps
   my refreshGroupView
}

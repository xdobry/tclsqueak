IDE::ConfigmapControler proc refreshGroupView {} {
  [my set view]::names setObjectsList [my set configmapGroups]
}

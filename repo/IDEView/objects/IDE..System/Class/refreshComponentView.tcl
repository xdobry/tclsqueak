IDE::System proc refreshComponentView component {
  if {[Object isobject IDE::CompViewDB]} {
       set nclass IDE::CompViewDB
  } else {
       set nclass IDE::CompView
  }
  foreach obj [$nclass info instances] {
       $obj refreshComponentView $component
  }
}

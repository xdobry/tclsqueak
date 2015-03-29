IDE::BreakpointEdit instproc changeActivity {} {
  my instvar isActive breakpoint
  if {$isActive} {
      $breakpoint activate
  } else {
      $breakpoint deactivate
  }
}

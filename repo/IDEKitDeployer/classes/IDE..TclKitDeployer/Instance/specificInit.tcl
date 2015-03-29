IDE::TclKitDeployer instproc specificInit {} {
  my instvar win isXOTclcode startPackFile targetDir configName startPackFile cleanXOTcl
  next
  set starPackFile ""
  set cleanXOTcl 1
  set targetDir [file join $targetDir [file rootname $configName].kit]
  $win.sframe.target configure -state disabled

  checkbutton $win.cleanXOTcl -text "ignore XOTcl additional libs" -variable [self]::cleanXOTcl
  if {![info exists ::starkit::topdir]} {
      set isXOTclcode 0
      set cleanXOTcl 0
      $win.isxotclcode configure -state disabled
      $win.cleanXOTcl configure -state disabled
  }
  frame $win.pframe
  label $win.pframe.lab -text "Starpack exe"
  label $win.pframe.target -border 2 -width 40 -relief sunken -anchor w -textvariable [self]::starPackFile
  button $win.pframe.change -text "Change" -command [list [self] changeStarpack]
  pack $win.pframe.lab  -side left
  pack $win.pframe.target -fill x -expand yes -side left
  pack $win.pframe.change -side left

  pack $win.cleanXOTcl -anchor w -before $win.buttons 
  pack $win.pframe -anchor w  -before $win.buttons
  my getComponentsToDeploy
}

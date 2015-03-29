IDE::ComponentSaveWizard instproc addItem item {
    if {$item eq ""} return
    [self]::savecomp addItem $item
}

IDE::ComponentSaveWizard instproc delItem item {
    if {$item ne ""} {
        [self]::savecomp removeItem $item
    }
}

IDE::ComponentSaveWizard instproc addAllToList {} {
    foreach item [[self]::complist getList] {
        my addItem $item
    }
}

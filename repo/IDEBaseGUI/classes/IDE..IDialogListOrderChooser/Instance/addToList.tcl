IDE::IDialogListOrderChooser instproc addToList {} {
    set sitem [my @listin selectedItem]
    if {$sitem ne ""} {
        my @listout addItemAtTail $sitem
        my @listin removeItem $sitem
    }
}

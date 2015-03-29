IDE::IDialogListChooser instproc addToList {} {
    set sitem [my @listin selectedItem]
    if {$sitem ne ""} {
        my addItemToList $sitem
    }
}

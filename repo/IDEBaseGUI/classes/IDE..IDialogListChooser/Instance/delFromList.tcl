IDE::IDialogListChooser instproc delFromList {} {
    set sitem [my @listout selectedItem]
    if {$sitem ne ""} {
        my removeItemFromList $sitem
    }
}

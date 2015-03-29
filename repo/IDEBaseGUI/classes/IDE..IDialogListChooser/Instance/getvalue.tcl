IDE::IDialogListChooser instproc getvalue {} {
    my instvar entry selectedItem
    if {$entry eq ""} {
        return $selectedItem
    }
    return $entry
}

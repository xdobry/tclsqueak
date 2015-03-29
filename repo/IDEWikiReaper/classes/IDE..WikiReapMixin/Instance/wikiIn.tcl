IDE::WikiReapMixin instproc wikiIn {} {
    set page [IDE::IDialogEntry getValueWithCancel "Get Wiki Page Number"]
    if {$page ne "_cancel"} {
        my setText [my reap $page]
    }
}

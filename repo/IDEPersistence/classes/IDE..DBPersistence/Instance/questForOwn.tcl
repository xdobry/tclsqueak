IDE::DBPersistence instproc questForOwn {} {
    if {![my istOwnEdition]
        && !([my exists dontAskOwn]
        && [my set dontAskOwn])} {
      set dlg [IDE::IDialogWithCheck new -volatile -checktext "Don'n ask for this element" -type okcancel -message "You are going to change not your edition"]
        if {[$dlg prompt] eq "ok"} {
            my set dontAskOwn 1
            return 1
        }
        return 0
    }
    return 1
}

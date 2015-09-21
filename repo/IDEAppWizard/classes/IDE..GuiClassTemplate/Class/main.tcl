IDE::GuiClassTemplate proc main argv {
    # if toplevel . has no widget so create the gui window on it
    if {[llength [winfo children .]]==0} {
        my new .
    } else {
        my openNewWindow
    }
}

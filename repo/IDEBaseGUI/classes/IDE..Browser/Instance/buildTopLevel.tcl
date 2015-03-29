IDE::Browser instproc buildTopLevel {} {
    my instvar win
    # gnome displays class as title of window (strange)
    ::toplevel $win
    # gnome shell needs it to group windows together
    wm group $win .
}

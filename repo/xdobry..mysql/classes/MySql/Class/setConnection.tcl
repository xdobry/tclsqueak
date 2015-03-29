MySql proc setConnection {name file defaults} {
    # Try to set connection descibed in pref file
    if {[file exists $file]} {
        set preffile [open $file r]
        while {[gets $preffile Zeile] >= 0} {
            if {[lindex $Zeile 0] eq "connection"} {
               set prefs [lindex $Zeile 1]
               break
            }
        }
        if {$prefs eq ""} { set prefs $defaults }
    } else {
       set prefs $defaults
    }
    MySql $name
    $name connect $prefs
}

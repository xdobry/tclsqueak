IDE::PlugInsManager proc readPlugInsList {{file {}}} {
    my instvar plugInsArr plugInsList
    if {$file eq ""} {
        set file [file join [IDE::System getSystemDir] pluginslist.txt]
    }
    if {![file exists $file]} return
    set fh [open $file r]
    while {[gets $fh line]>=0} {
        if {[string match #* $line] || $line eq ""} continue
        lappend plugInsList [lindex $line 0]
        set plugInsArr([lindex $line 0]) $line
    }
    close $fh
}

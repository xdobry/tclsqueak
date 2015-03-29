POTHelper proc convertPoToWin {} {
    set filetemp [IDE::Dialog getOpenFile]
    set filepo [IDE::Dialog getOpenFile]
    set fileout [IDE::Dialog getSaveFile TimePunch.Polish.properties]

    set fi [open $filepo r]
    while {[gets $fi line]>=0} {
        set line [string trim $line]
        if {$line eq ""} continue
        if {[lindex $line 0] eq "msgid"} {
            set msgid [string trim [lindex $line 1] \"]
        }
        if {[lindex $line 0] eq "msgstr"} {
            set from($msgid) [string trim [lindex $line 1] \"]
        }
    }
    close $fi

    set fi [open $filetemp r]
    set fo [open $fileout w]
    while {[gets $fi line]>=0} {
        set line [string trim $line]
        if {$line eq ""} {
            puts $fo $line
            continue
        }
        set i [string first = $line]
        if {$i<0} {
            puts $fo $line
            continue
        }
        set eng [string range $line [expr {$i+1}] end]
        if {[info exists from($eng)]} {
            puts $fo [string range $line 0 $i]$from($eng)
        } else {
            puts $fo $line
        }
    }
    close $fi
    close $fo
}

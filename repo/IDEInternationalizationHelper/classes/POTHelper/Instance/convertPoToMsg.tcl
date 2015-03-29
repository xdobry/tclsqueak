POTHelper instproc convertPoToMsg {{fileName {}}} {
    if {$fileName eq ""} {
         set types {{"POT catalog" .po}}
         set fileName [IDE::Dialog getOpenFile $types]
    }
    if {$fileName eq ""} return
    set types {{"MSG Tk catalog" .msg}}
    set outFileName [IDE::Dialog getSaveFile {} $types .msg]
    if {$fileName eq ""} return

    set if [open $fileName w]
    set of [open $outFileName w]
    set waitmode msgid
    set oldmode msgstr
    set msgidList [list]
    set msgstrList [list]
    while {[gets $if line]>= 0} {
        if {[regexp {^\s*#} $line] || [string trim $line] eq ""} {
            puts $of $line
        } else {
            if {[regexp "^\s+(".*")" $line _ rest]} {
                lappend ${oldmode}List $rest
            } else if {[regexp "^$waitmode .*" $line _ rest]} {
                set oldmode $waitmode
                lappend ${oldmode}List $rest
                if {$waitmode eq msgid && [llength $msgidList]>0} {
                    puts $of "::msgcat::mcset de $msgidList $msgstrList"
                }
                if {$waitmode eq "" msgid} {
                    set waitmode msgstr
                } else {
                    set waitmode msgid
                }
            } else {
                error "await $waitmode key word"
            }
        }
    }
    close $if
    close $of
}

POTHelper instproc loadPoMessages {} {
    set types {{"POT catalog" .po} {"Messages catalog" .messages}}
    set fileName [IDE::Dialog getOpenFile $types]
    if {$fileName eq ""} return
    set lan [IDE::IDialogEntry getValue "Target Language"]
    my instvar cat_$lan langs
    if {[info exists langs] && [lsearch $langs $lan]>=0} {
        unset -nocomplain cat_$lan
    } else {
        lappend langs $lan
    }


    set if [open $fileName r]
    fconfigure $if -encoding utf-8

    set waitmode msgid
    set oldmode msgstr
    set msgidList ""
    set msgstrList ""
    set count 0
    while {[set r [gets $if line]]>=0} {
        puts "$waitmode $line"
        if {[regexp {^\s*#} $line] || [string trim $line] eq ""} {
            # puts $of $line
        } else {
            if {[regexp {^\s*"(.*)"} $line _ rest]} {
                set rest [string trim $rest \"]
                if {[string range $rest 0 1] eq "_:"} {
                    continue
                }
                append ${oldmode}List $rest
            } elseif {[regexp "^$waitmode (.*)" $line _ rest]} {
                set oldmode $waitmode
                if {$waitmode eq "msgid" && [string length $msgidList]>0} {
                    set cat_${lan}($msgidList) $msgstrList
                    set msgidList [string trim $rest \"]
                    set msgstrList ""
                    incr count
                } else {
                    set msgstrList [string trim $rest \"]
                }
                if {$waitmode eq "msgid"} {
                    set waitmode msgstr
                } else {
                    set waitmode msgid
                }
            }
        }
    }
    if {$waitmode eq "msgid" && [string length $msgidList]>0} {
        set cat_${lan}($msgidList) $msgstrList
        set msgidList ""
        set msgstrList ""
        incr count
    }
    puts "last gets $r $line"
    close $if
    return $count
}

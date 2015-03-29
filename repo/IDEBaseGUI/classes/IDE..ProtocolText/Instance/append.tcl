IDE::ProtocolText instproc append text {
    my instvar odd itemsNumber regexpr inverseMatch count protocolOn itemLines itemsNumber
    if {!$protocolOn} return
    if {$regexpr ne ""} {
        if {[regexp -- $regexpr $text]} {
            if {$inverseMatch} return
        } else {
            if {!$inverseMatch} return
        }
    }
    set twin [my getTextWindow]
    set end [$twin index "end - 1 c"]
    $twin insert end $text\n
    set newEnd [$twin index "end - 1 l"]
    set lines [expr {[lindex [split $newEnd .] 0]-[lindex [split $end .] 0]}]
    if {$odd} {
        $twin tag add odditem $end $newEnd
    }
    set odd [expr {!$odd}]
    $twin see end
    incr count
    lappend itemLines $lines
    if {$itemsNumber ne ""} {
        if {[catch {expr {$itemsNumber+1}}] || $itemsNumber<=0} {
            set itemsNumber ""
        } else {
            if {$count>$itemsNumber} {
                set linesToDelete [expr {$count-$itemsNumber}]
                set range [lrange $itemLines 0 [expr {$linesToDelete-1}]]
                set itemLines [lrange $itemLines $linesToDelete end]
                set allLines 1
                foreach lc $range {
                    incr allLines $lc
                }
                $twin delete 1.0 $allLines.0
                set count $itemsNumber
            }
        }
    }
}

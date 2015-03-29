IDE::Editor instproc evalErrorString {{errorRef {}}} {
    set sel [my getSelection]
    if {$sel eq ""} {
        if {$errorRef ne ""} {
            upvar $errorRef error
            set error 1
        }
        return
    }
    if {[catch {my evalString $sel} ret]} {
        set info $::errorInfo
        set list {}
        set last {}
        set wasProc 0
        set lline 0
        set lproc [list]
        set lobjectsList [list]
        foreach line [split $info \n] {
            if {!$wasProc} {
                #uts "regexp $line"
                if {[regexp -- {\(procedure "(.+)" line (.+)\)} $line _ lproc lline]} {
                    #uts "fond $line"
                    set wasProc 1
                } elseif {[regexp -- {\(compiling body of proc "(.+)", line (.+)\)} $line _ lproc lline]} {
                    set wasProc 1
                } elseif {[regexp -- {\(in namespace eval "::" script line (.+)\)} $line _ lline]} {
                    set lproc _namespace
                    set wasProc 1
                } else {
                    if {[info complete $last]} {
                        set last $line
                    } else {
                        append last \n $line
                    }
                }
            } else {
                set line [string trim $line]
                if {[regexp -- {(.+)->(.+)} $line _ objectstring method]} {
                    #puts "os $objectstring m $method"
                    if {[llength $objectstring]>1} {
                        set object [lindex $objectstring 0]
                        set class [lindex $objectstring 1]
                        lappend list "$class>$method"
                    } else {
                        set object {}
                        lappend list "$objectstring class>$method"
                    }
                    lappend objectsList $object
                } else {
                    # should be normal tcl proc
                    lappend objectsList {}
                    lappend list $lproc
                }
                lappend invokeList [string trim $last \"] $lline
                set last {}
                set wasProc 0
            }
        }
        if {[lindex $list 0] eq "_namespace"} {
            set range [[my getTextWindow] tag ranges sel]
            if {[lindex $invokeList 1]==1} {
                set startline [lindex $range 0]
            } else {
                set startline [lindex [split [lindex $range 0] .] 0]
                set startline [expr {$startline+[lindex $invokeList 1]-1}].0
            }
            set twin [my getTextWindow]
            # add variables (count)
            set cur [$twin search -count count -- [lindex $invokeList 0] $startline end]
            if {$cur ne ""} {
                #$twin tag add hlight $cur "$cur + $count char"
                set lastindex [$twin index "$cur + $count char"]
                $twin tag remove sel 1.0 end
                $twin insert $lastindex $ret sel
                $twin mark set insert $lastindex
                #$twin tag add sel $lastindex [$twin index "$lastindex + [string length $ret] char"]
            }
        } else {
            bgerror $info
        }
        if {$errorRef ne ""} {
            upvar $errorRef error
            set error 1
        }
        return ""
    } else {
        if {$errorRef ne ""} {
            upvar $errorRef error
            set error 0
        }
        return $ret
    }
}

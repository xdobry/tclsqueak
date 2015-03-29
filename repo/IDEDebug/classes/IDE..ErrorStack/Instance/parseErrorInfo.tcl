IDE::ErrorStack instproc parseErrorInfo pinfo {
    my instvar objectsList invokeList info
    set info $pinfo
    set list {}
    set last {}
    set wasProc 0
    foreach line [split $info \n] {
        if {!$wasProc} {
            #uts "regexp $line"
            if {[regexp -- {\(procedure "(.+)" line (.+)\)} $line _ lproc lline]} {
                #uts "fond $line"
                set wasProc 1
            } elseif {[regexp -- {\(class "(.+)" method "(.+)" line (.+)\)} $line _ class method lline]} {
                set lproc "$class oo>$method"
                set wasProc 1
            } elseif {[regexp -- {\(object "(.+)" method "(.+)" line (.+)\)} $line _ class method lline]} {
                set lproc "$class ooclass>$method"
                set wasProc 1
            } elseif {[regexp -- {\(compiling body of proc "(.+)", line (.+)\)} $line _ lproc lline]} {
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
            lappend invokeList [string trim $last \"]
            set last {}
            set wasProc 0
        }
    }
    if {$list ne ""} {
        [self]::methodlist setListUnsorted $list
    }
}

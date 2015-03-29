PrsLiteral instproc canAssignTypeBase {type context} {
    set content [my prsString]
    set type0 [lindex $type 0]
    if {($type0 eq "tk" || ($type0 eq "new" && [lindex $type 1] eq "tk")) && [regexp {^\.($|[_a-z])} $content]} {
        return 1
    } elseif {$type0 eq "boolean" && [string is boolean $content]} {
        return 1
    } elseif {$type0 eq "int" && [string is integer $content]} {
        return 1
    } elseif {$type0 eq "double" && [string is double $content]} {
        return 1
    } elseif {$type0 eq "index" && ([string is integer $content] || [regexp {end(-\d+)?} $content])} {
        return 1
    } elseif {$type0 eq "channelid" && $content in {stdin stderr stdout}} {
        return 1
    } elseif {$type0 eq "list" && ![catch {lindex $content 0}]} { #ttc noerror
        return 1
    } elseif {$type0 eq "pixel" && [regexp {^\d*\.?\d+[cimp]?$} $content]} {
        return 1
    } elseif {$type0 eq "new"} {
        return 1
    } elseif {$type0 eq "enum" && $content in [lrange $type 1 end]} {
        return 1
    } elseif {$type0 eq "color" && [ttype::isColor $content]} {
        return 1
    } elseif {[lindex $type 0] in {tk xotcl class}} {
        set repo [$context set repository]
        set classes [$repo getFullHeritage [my prsString] [$context set namespace]]
        if {[llength $type]==1} {
            switch -exact -- [lindex $type 0] {
                tk {
                    return [expr {"::widget" in $classes}]
                }
                xotcl {
                    return [expr {"::xotcl::Object" in $classes || "Class" in $classes}]
                }
                default {
                    return 1
                }
            }
        }
        if {[lindex $type 1] in $classes} {
            set type $type
            return 1
        }
    }
    return 0
}

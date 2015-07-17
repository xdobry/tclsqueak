PrsLiteral instproc canAssignTypeBase {type context} {
    # warning return not boolean but 
    # 1 yes
    # 0 no
    # -1 unknown (could be)
    set content [my prsString]
    set type0 [lindex $type 0]
    if {($type0 eq "tk" || ($type0 eq "new" && [lindex $type 1] eq "tk"))} {
        return [regexp {^\.($|[_a-z])} $content]
    } elseif {$type0 eq "boolean"} {
        return [string is boolean $content]
    } elseif {$type0 eq "int"} {
        return [string is integer $content]
    } elseif {$type0 eq "double"} {
        return [string is double $content]
    } elseif {$type0 eq "index"} {
        return [expr {([string is integer $content] || [regexp {end(-\d+)?} $content])}]
    } elseif {$type0 eq "channelid"} {
        return [expr {$content in {stdin stderr stdout}}]
    } elseif {$type0 eq "list"} { 
        return [expr {![catch {lindex $content 0}]}]; #ttc noerror
    } elseif {$type0 eq "pixel"} {
        return [regexp {^\d*\.?\d+[cimp]?$} $content]
    } elseif {$type0 eq "new"} {
        return 1
    } elseif {$type0 eq "enum"} {
        return [expr {$content in [lrange $type 1 end]}]
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
    return -1
}

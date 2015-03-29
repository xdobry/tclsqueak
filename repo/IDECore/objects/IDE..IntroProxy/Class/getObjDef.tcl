IDE::IntroProxy proc getObjDef name {
    set script [my getBaseObjDef $name]
    if {[Object isclass $name]} {
        set sl [$name info superclass]
        if {$sl != "" && $sl != "::Object" && $sl ne "::xotcl::Object"} {
            append script " -superclass [list $sl]"
        }
        set pr [$name info parameter]
        if {$pr != ""} {
            append script " -parameter [list $pr]\n"
        } else {
            append script "\n"
        }
    } else {
        append script "\n"
    }
    return $script
}

PrsLiteral instproc getStringSubType {} {
    set content [my prsString]
    if {$content eq ""} {
        return empty
    } elseif {[regexp {^\.($|[_a-z])} $content]} {
        return tk
    } elseif {[regexp {end(-\d+)?} $content]} {
        return index
    } elseif {$content in {stdin stderr stdout}} {
        return channelid
    } elseif {[regexp {^\d*\.?\d+[cimp]?$} $content]} {
        return pixel
    } elseif {[ttype::isColor $content]} {
        return color
    }
    return
}

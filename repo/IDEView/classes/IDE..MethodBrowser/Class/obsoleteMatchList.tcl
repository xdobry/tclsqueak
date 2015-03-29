IDE::MethodBrowser proc obsoleteMatchList {text mlist} {
    foreach item $mlist {
        set expr "(?n)^\s*$item\[\[:>:\]\]"
        if {[regexp $expr $text]} {return 1}
    }
    return 0
}

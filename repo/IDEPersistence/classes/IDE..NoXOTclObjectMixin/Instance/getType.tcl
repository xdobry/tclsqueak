IDE::NoXOTclObjectMixin instproc getType {} {
    set type [next]
    return "[[my getCompIntroProxy] getOOSystemPrefix]$type"
}

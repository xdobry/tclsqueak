IDE::ProcsGroup instproc handleDefinitionScript skript {
    if {![my withNamespace]} {
        IDE::Dialog error "Proc Group have no namespace. No Definition skript is posible"
        return
    }
    if {[llength $skript]!=4 ||
    [lindex $skript 0] ne "namespace" ||
    [lindex $skript 1] ne "eval" ||
    [lindex $skript 2] ne "::[my name]"} {
        IDE::Dialog error "Definition of Proc Group accept the format: namespace eval ::[my name] skript"
        return
    }
    namespace eval :: $skript
    my setDefBody $skript
}

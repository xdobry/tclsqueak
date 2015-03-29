POTHelper instproc initFromExisting {} {
    my instvar catalog
    set indicator [array startsearch ::msgcat::Msgs]
    while {[array anymore ::msgcat::Msgs $indicator]} {
        set elem [array nextelement ::msgcat::Msgs $indicator]
        set lan [msgcat::mclocale]
        if {[regexp "$lan,::,(.+)" $elem _ text]} {
            lappend $catalog $text
        }
    }
    array donesearch ::msgcat::Msgs $indicator
    my setItem 0
}

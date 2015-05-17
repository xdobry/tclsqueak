IDE::ClassSelector proc getClass {{title {Choose the class}}} {
    set types [list]
    foreach ip [IDE::XOIntroProxy getIntroProxies] {
        lappend types {*}[$ip getClasses]
        lappend types {*}[$ip getObjects]
    }
    set clist [ide::lcollect each $types {string trimleft $each :}]
    IDE::IDialogListFilter selectFromList $title $clist
}

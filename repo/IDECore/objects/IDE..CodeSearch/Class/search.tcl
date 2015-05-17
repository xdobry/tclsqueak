IDE::CodeSearch proc search searchDict {
    # search dict has following entries
    # text - mandatory
    # type {text | implementors | word} - mandatory
    # scope {all | component | object } - mandatory
    # context { component clasc|object } - optional
    # introProxy - optional
    # caseSensitive - optional default yes
    # regexpr - optional default yes

    switch -- [dict get $searchDict scope] {
        all {
            set result [list]
            set subdict $searchDict
            dict set subdict scope component
            foreach comp [[IDE::XOIntroProxy getIntroProxy] getUserRelevantComponents] {
                dict set subdict context $comp
                lappend result {*}[my searchComponent $subdict]
            }
            dict set searchDict result $result
        }
        component {
            dict set searchDict result [my searchComponent $searchDict]
        }
        object {
            dict set searchDict result [my searchObject $searchDict]
        }
    }
    return $searchDict
}

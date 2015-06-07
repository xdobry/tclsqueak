IDE::CodeSearch proc search searchDict {
    # search dict has following entries
    # text - mandatory
    # type {text | implementors | word} - mandatory
    # scope {all | component | object } - mandatory
    # context { component clasc|object } - optional
    # introProxy - optional
    # caseSensitive - optional default yes
    # regexp - optional default yes
    
    # convert text to regular expression by using masking
    if {[dict exists $searchDict regexp] && [dict get $searchDict regexp]==0 && [dict get $searchDict type] eq "text"} {
        set text [dict get $searchDict text]
        dict set searchDict text [string map [list * \\* . \\. ^ \\^ $ \\$ ? \\? ( \\) ) \\) \\ \\\\ \] \\\] \[ \\\[ \{ \\\{ \} \\\}] $text]
        dict set searchDict regexp 1
    }

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

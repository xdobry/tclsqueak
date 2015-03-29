IDE::TkWinList instproc selectItem window {
    set parent [my info parent]
    if {[Object isobject ${parent}::conflist]} {
        ${parent}::conflist selectFor $window
    }
    if {[Object isobject ${parent}::valuetext]} {
        set text {}
        set sequences {}
        if { [winfo exists $window] } {
            set tags [bindtags  $window]
            append text "BINDTAGS: $tags\n"
            foreach tag $tags {
                append text " BINDS ${tag}:\n"
                set binds [lsort [bind $tag]]
                set sequences [concat $sequences $binds]
                foreach bind $binds {
                    append text "   ${bind}: [bind $tag $bind]\n"
                }
            }
        }
        ${parent}::valuetext setTextControler $text [self]
        foreach sequence $sequences {
            ${parent}::valuetext colorizeTextAll $sequence
        }
    }
}

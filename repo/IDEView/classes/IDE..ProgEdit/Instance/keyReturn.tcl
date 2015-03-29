IDE::ProgEdit instproc keyReturn {} {
    # binding for Return key
    if {![my set useEditMode]} return
    if {![my set beginReturn]} return
    my set beginReturn 0

    if {[my editMode] eq "xotcl"} {
        set tabCount [my getIdent]
        if {$tabCount>0} {
            my appendToCursor [string repeat { } $tabCount]
        } elseif {$tabCount<0} {
            set tabCount [expr {-$tabCount}]
            my appendToCursor [string repeat { } $tabCount]
            set win [my getTextWindow]
            if {[$win index {insert lineend + 1 c}]==[$win index end]} {
                set insert [$win index insert]
                $win insert end "\n[string repeat { } [expr {$tabCount-4}]]\}\n"
                $win mark set insert $insert
            } else {
                $win insert {insert lineend + 1 c} "[string repeat { } [expr {$tabCount-4}]]\}\n"
            }
        }
    }
}

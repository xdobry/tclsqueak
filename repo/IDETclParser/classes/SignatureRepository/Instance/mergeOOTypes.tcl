SignatureRepository instproc mergeOOTypes {istypeWithName newtype} {
    # istype is list {type name}
    # returns list {type name}
    set classes [my getFullHeritage [lindex $istypeWithName 0 1]]
    set tclasses [my getFullHeritage [lindex $newtype 1]]
    set i 0
    set bclass [list [lindex $istypeWithName 0 0]]
    foreach c $classes {
        if {$c in $tclasses} {
            lappend bclass $c
            break
        }
    }
    return [list $bclass [lindex $istypeWithName 1]]
}

IDE::GuiClassBuilder instproc applyScript {script desc} {
    # just replace descr dict value if exists
    # %%desc_key%%
    if {[dict exists $desc $script]} {
        return [dict get $desc $script]
    }
    # very base conditional templating
    # %%if {expr} {content_true} {content_false}%%
    if {[lindex $script 0] eq "if"} {
        if [lindex $script 1] {
            return [lindex $script 2]
        } else {
            return [lindex $script 3]
        }
    }
    if {[lindex $script 0] eq "comment"} {
        return
    }
    return $script
}

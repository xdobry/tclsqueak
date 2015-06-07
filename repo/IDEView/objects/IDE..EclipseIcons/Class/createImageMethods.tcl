IDE::EclipseIcons proc createImageMethods {} {
    set names {
        save_edit
        copy_edit
        cut_edit
        paste_edit
        undo_edit
        redo_edit
        search
        find
        hierarchy
        forward_nav
        backward_nav
        new_wiz
        last_edit_pos
        refresh
        open-task
        history_list
        sub_co
        super_co
        search_history
        syntax_check
        delete_obj
        next_nav
        previous
        main_tab
        sourceEditor
        environment
        prev_nav
    }
    set dir [file join ~ eclipse-icons]
    foreach name $names {
        set methodName [my getMethodName $name]
        if {[my info procs $methodName] ne ""} {
            continue
        }
        set f [open [file join $dir $name.gif] r]
        fconfigure $f -encoding binary
        set r [binary encode base64 [read $f]]
        close $f
        IDE::EclipseIcons proc $methodName {} "
    image create photo $name -data {$r}
"
    }
}

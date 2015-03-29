IDE::EditorPopDown instproc invokePopDown {mlist pattern} {
    if {$mlist eq ""} return
    my instvar compPattern
    set compPattern $pattern
    if {[llength $mlist]==1} {
        set sindex [expr {[string length $compPattern] + [string first [string range $compPattern 0 end-1] $mlist] -1}]
        my appendToCursor "[string range $mlist $sindex end]"
        return
    }
    set twin [my getTextWindow]
    set popWin [my getPopdown]
    $popWin.listbox delete 0 end
    eval $popWin.listbox insert 0 $mlist
    set height [winfo reqheight $popWin.listbox]
    set width [expr {[winfo reqwidth $popWin.listbox]+[winfo reqwidth $popWin.scroll]}]
    set bb [$twin bbox insert]
    set x [expr {[lindex $bb 0]+[winfo rootx $twin]}]
    set y [expr {[lindex $bb 1]+[winfo rooty $twin]}]
    wm geometry $popWin $width\x$height+$x+$y
    wm deiconify $popWin
    raise $popWin
    ::focus $popWin.listbox
}

IDE::Toolbar instproc showTooltip win {
    my instvar tooltips
    if {![winfo exists $win] || ![winfo viewable $win]} {return}
    set text $tooltips($win)

    if {[eval winfo containing [winfo pointerxy .]] ne $win} {return}
    set top $win.balloon
    catch {destroy $top}
    toplevel $top -bd 1 -bg black
    wm overrideredirect $top 1
    if {$::tcl_platform(platform) eq "macintosh"} {
        unsupported1 style $top floating sideTitlebar
    }
    pack [message $top.txt -aspect 10000 -bg lightyellow -font fixed -text $text]
    set wmx [winfo rootx $win]
    set wmy [expr {[winfo rooty $win]+[winfo height $win]}]
    wm geometry $top [winfo reqwidth $top.txt]x[winfo reqheight $top.txt]+$wmx+$wmy
    raise $top
}

IDE::Text instproc init window {
    my instvar win state height width
    set win $window
    ::frame $win
    ttk::scrollbar $win.scroll -command "$win.text yview" -takefocus 0
    set bgcolor [my getParameter textcolor]
    if  {$bgcolor ne ""} {
        ::text $win.text -yscrollcommand "$win.scroll set" -width $width -height $height -font textfont -background $bgcolor
    } else {
        ::text $win.text -yscrollcommand "$win.scroll set" -width $width -height $height -font textfont
    }
    $win.text configure -undo 1
    pack $win.scroll -side right -fill y
    pack $win.text -expand yes -fill both
    set state empty
    my initFonts
    my initTags
    my initBindings
    next
}

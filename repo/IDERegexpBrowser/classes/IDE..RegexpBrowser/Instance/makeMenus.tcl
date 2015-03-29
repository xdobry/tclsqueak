IDE::RegexpBrowser instproc makeMenus {} {
    my instvar win data
    set rootwindow $win
    set top $win
    IDE::RegexpBrowser instvar colors bgcolors color_noreport color_lookahead geometry show_help regexp_db history font_regexp font_sample version mode font_replace background
    
    $rootwindow configure -menu $top.menubar
    set m [menu $top.menubar -tearoff 0 -bd 1 -activeborderwidth 1]
    # file
    $m add cascade -menu $m.file -label "File" -underline 0
    set mm [menu $m.file -tearoff 0 -bd 1 -activeborderwidth 1]
    $mm add command -label "Load regexp ..." -command [list [self] regexp:load]
    $mm add command -label "Load sample ..." -command [list [self] sample:load] -accelerator "Alt-O"
    $mm add separator
    $mm add command -label "Save sample (auto) ..." -command [list [self] sample:save auto] -accelerator "Alt-S"
    $mm add command -label "Save sample Unix (lf) ..." -command [list [self] sample:save lf]
    $mm add command -label "Save sample Windows (crlf) ..." -command [list [self] sample:save crlf]
    $mm add command -label "Save sample Mac (cr) ..." -command [list [self] sample:save cr]
    $mm add separator
    $mm add command -label "Quit" -underline 0 -command [list [self] closeWindow] -accelerator "Alt-Q"
    # edit
    $m add cascade -menu $m.edit -label "Edit" -underline 0
    set mm [menu $m.edit -tearoff 0 -bd 1 -activeborderwidth 1]
    $mm add command -label "Copy regexp to clipboard" -command [list [self] dump] -accelerator "Alt-C"
    $mm add separator
    $mm add command -label "Undo" -command [list [self] unredo:regexp -1] -accelerator "Control-Z"
    $mm add command -label "Redo" -command [list [self] unredo:regexp +1] -accelerator "Control-R"
    # view
    $m add cascade -menu $m.view -label "View" -underline 0
    set mm [menu $m.view -tearoff 0 -bd 1 -activeborderwidth 1]
    set data(v:background) $background
    # sample:background
    $mm add checkbutton -label "Show background for matches" -command [list [self] sample:background]  -variable [self]::v_background
    $mm add checkbutton -label "Show regexp help" -command [list [self] regexp:help:toggle]  -variable [self]::v_help
    set data(v:help) $show_help
    $mm add checkbutton -label "Wrap lines in sample" -variable [self]::v_wrap  -command [list [self] changeSampleWrap]  -offvalue "none" -onvalue "char"
    my set v_history $history
    $mm add checkbutton -label "History of Regexp" -variable [self]::v_history  -command [list [self] showHistory]
    # select mode
    $m add cascade -menu $m.select -label "Select mode" -underline 5
    set mm [menu $m.select -tearoff 0 -bd 1 -activeborderwidth 1]
    $mm add radiobutton -label "select / concat raw matches"  -variable [self]::v_mode -value "raw" -command [list [self] replace:toggle]
    $mm add radiobutton -label "select / insert new line between matches" -variable [self]::v_mode -value "nl" -command [list [self] replace:toggle]
    $mm add radiobutton -label "replace widget"  -variable [self]::v_mode -value "replace" -command [list [self] replace:toggle]
    # insert well know regexp
    $m add cascade -menu $m.insert -label "Insert regexp" -underline 11
    set mm [menu $m.insert -tearoff 0 -bd 1 -activeborderwidth 1]
    $mm add command -label "Make regexp ..." -command [list [self] make-regexp]
    $mm add separator
    $mm add command -label "Load patterns ..." -command [list [self] pattern:load]
    $mm add separator
    foreach {n e} $regexp_db {
        $mm add command -label "$n" -command [list [self] regexp:insert [list $e]]
    }
    set data(w:menu) $mm
    # help
    $m add cascade -menu $m.help -label "Help" -underline 0
    set mm [menu $m.help -tearoff 0 -bd 1 -activeborderwidth 1]
    $mm add command -label "Help" -command [list [self] help]
}

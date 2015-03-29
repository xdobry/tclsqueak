IDE::RegexpBrowser instproc init topwindow {
    my instvar data win winRegexp
    my requireNamespace
    IDE::RegexpBrowser instvar colors bgcolors color_noreport color_lookahead geometry show_help regexp_db history font_regexp font_sample version mode font_replace background
    global tcl_platform

    set data(v:undo:index) 0
    set data(v:undo:sample) ""
    set data(v:dir) "."
    set data(v:file) "untitled.txt"
    my set last ""
    my set counter 0
    my set inReplay 0
   
    my history:init

    set win $topwindow
    set top [toplevel $win]
    wm protocol $win WM_DELETE_WINDOW [list [self] closeWindow]
    set rootwindow [winfo toplevel $top]
    # frame for regexp
    set w [frame $top.regexp -bd 2 -relief groove]
    # options
    set fo [frame $w.options]
    set sep 0
    foreach option {nocase all - line lineanchor linestop - inline}  label {nocase all - line "lineanchor (k)" "linestop (m)" - inline}  underline {0 0 - 0 12 10 - 0} {
        if {$option != "-"} {
            checkbutton $fo.$option -text $label -bd 1 -underline $underline  -variable [self]::v:$option  -offvalue "" -onvalue "-$option"
            my set v:$option ""
            pack $fo.$option -side left
        } else {
            pack [frame $fo.[incr sep] -width 40] -side left
        }
    }
    # text for regexp entry
    set data(w:regexp) [text $w.regexp -wrap char -bg white -font $font_regexp  -selectbackground lightblue -selectborderwidth 0  -width 1 -height 3 -bd 1]
    set winRegexp $data(w:regexp)
    
    my makeHelpWindow $w
    
    # buttons & selection of match
    set fb [frame $w.b]
    button $fb.go -text "Go" -underline 0 -command [list [self] go] -bd 1 -width 5
    button $fb.clear -text "Clear (z)" -underline 7 -command [list [self] clear] -bd 1 -width 5
    pack $fb.go [frame $fb.00 -width 10] $fb.clear -side left -pady 5

    # selection - buttons for match level
    label $fb.sep
    label $fb.l -text "Select:"
    pack $fb.sep -side left -fill x -expand true
    pack $fb.l -side left -padx 5 -pady 5
    set i 0
    foreach c $colors t {match 1 2 3 4 5 6 7 8 9} {
        button $fb.$i -text $t -fg $c -bd 1 -padx 0 -width 6 -command [list [self] select $i]
        pack $fb.$i -side left -fill y -pady 5
        incr i
    }
    # text for replace
    set f [frame $w.replace]
    set data(w:replace) [text $f.replace -wrap char -bg white -font $font_replace  -selectbackground lightblue -selectborderwidth 0  -width 1 -height 2 -bd 1]
    button $f.do -text "Replace" -underline 0 -bd 1 -width 9 -command [list [self] replace]
    label $f.nb -textvariable [self]::v_nbreplace -width 12 -anchor e
    pack $data(w:replace) -side left -expand true -fill both -pady 5 -padx 5
    pack $f.do -side left -pady 5
    pack $f.nb -side left -pady 5 -padx 5
    # layout
    pack [frame $w.0 -height 5] $data(w:regexp) -side top -anchor w -padx 5 -expand true -fill both
    pack $fo $fb -side top -anchor w -padx 5 -expand true -fill both
    pack $fb -side top -anchor w -padx 5 -expand true -fill both
    set data(w:allreplace) $f
    # frame for sample
    set w [frame $top.sample -bd 2 -relief groove]
    set w [frame $w.inner]
    pack $top.sample.inner -padx 5 -pady 5 -fill both -expand true
    # text for sample highlighting
    set data(w:sample) [text $w.sample  -bg white -font $font_sample -bd 1 -width 1 -height 20  -selectbackground lightblue -selectborderwidth 0  -yscrollcommand "$w.sy set" -xscrollcommand "$w.sx set"]
    scrollbar $w.sy -command "$w.sample yview" -orient vertical -bd 1
    scrollbar $w.sx -command "$w.sample xview" -orient horizontal -bd 1
    # set tags for colors & special
    set data(v:levels) {e0 e1 e2 e3 e4 e5 e6 e7 e8 e9}
    foreach level $data(v:levels)  color $colors {
        $data(w:regexp) tag configure $level -foreground $color
        # $data(w:history) tag configure $level -foreground $color
        $data(w:sample) tag configure $level -foreground $color
    }
    $data(w:regexp) tag configure lookahead -background $color_lookahead
    $data(w:regexp) tag configure noreport -background $color_noreport
    $data(w:history) tag configure lookahead -background $color_lookahead
    $data(w:history) tag configure noreport -background $color_noreport
    # actions
    set f [frame $w.matches]
    label $f.nb -textvariable [self]::v_nbmatches -anchor w
    my set v_nbmatches "0 matches"
    # button for navigation
    button $f.p -text "Previous" -bd 1 -pady 2 -width 8 -command [list [self] sample:move -1]
    button $f.n -text "Next" -bd 1 -pady 2 -width 8 -command [list [self] sample:move +1]
    set data(v:positions) [list ]
    set data(v:position) 0
    # layout
    pack $f.nb [frame $f.0 -width 15] $f.p $f.n -padx 5 -side left
		
    # layout
    grid $w.sample	$w.sy	-sticky news
    grid $w.sx		x		-sticky news
    grid $w.matches	-		-sticky news
    grid rowconfigure $w {0} -weight 1
    grid columnconfigure $w {0} -weight 1
    # main layout
    pack $top.regexp -side top -anchor w -padx 5 -pady 5 -fill x
    pack $top.sample -side top -anchor w -padx 5 -pady 5 -expand true -fill both
    #wm geometry $rootwindow $geometry
    wm title $rootwindow "Visual REGEXP $version - XOTclIDE Plugin"
    focus $data(w:regexp)
    # main menu
    my makeMenus

    # key binding
    my makeBindings

    # some init
    my set v_nocase -nocase
    my set v_all -all
    my set v_wrap char
    my set v_mode $mode
    my replace:toggle		;# set bindings
    my regexp:help:toggle
}

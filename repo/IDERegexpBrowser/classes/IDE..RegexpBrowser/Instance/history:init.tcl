IDE::RegexpBrowser instproc history:init {} {
    my instvar data w_history historyWin
    IDE::RegexpBrowser instvar font
    set w [toplevel [Object autoname .history]]
    set historyWin $w
    
    wm title $w "Visual REGEXP [IDE::RegexpBrowser set version] -- REGEXP History"
    wm geometry $w 640x480
    wm protocol $w WM_DELETE_WINDOW "[self] set v_history 0; wm withdraw $w"

    # text zone	
    set tf [frame $w.t]
    pack $tf -side top -expand true -fill both
    set t [text $tf.t -xscrollcommand "$tf.x set" -yscrollcommand "$tf.y set"  -bg white -font [IDE::RegexpBrowser set font_regexp] -width 5 -height 1  -selectbackground lightblue -selectborderwidth 0]
    
    set w_history $t
    set data(w:history) $t
    
    $t tag configure spacing -font {Helvetica 6}
    set tx [scrollbar $tf.x -bd 1 -orient horizontal -command "$t xview"]
    set ty [scrollbar $tf.y -bd 1 -orient vertical -command "$t yview"]
    bindtags $t "$t all"
    grid $t  $ty -sticky news
    grid $tx x   -sticky news
    grid columnconfigure $tf {0} -weight 1
    grid columnconfigure $tf {1} -weight 0
    grid rowconfigure $tf {0} -weight 1
    grid rowconfigure $tf {1} -weight 0

    # buttons
    set bf [frame $w.f]
    pack $bf -side bottom -padx 5 -pady 5

    set b1 [button $bf.1 -bd 1 -text "Hide" -command "wm withdraw $w; [self] set v_history 0"]
    set b2 [button $bf.2 -bd 1 -text "Save ..." -command [list [self] history:save]]
    pack $b2 $b1 -side left -anchor c

    wm withdraw $w
}

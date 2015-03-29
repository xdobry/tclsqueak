IDE::RegexpBrowser instproc makeBindings {} {
    my instvar data win
    set fo $win.regexp.options
    set top $win
    
    bind $top <Alt-q> [list [self] closeWindow]
    bind $top <Alt-g> [list [self] go]
    bind $data(w:regexp) <Return> "[self] go; break"
    bind $top <Alt-c> [list [self] dump]
    bind $top <Alt-r> [list [self] replace]
    bind $top <Alt-o> [list [self] sample:load]
    bind $top <Alt-s> [list [self] sample:save auto]

    bind $data(w:regexp) <Control-z> [list [self] unredo:regexp -1]
    bind $data(w:regexp) <Control-r> [list [self] unredo:regexp +1]

    bind $data(w:replace) <Control-z> [list [self] undo:sample]
    bind $data(w:sample) <Control-z> [list [self] undo:sample]

    bind $top <Alt-a> "$fo.all toggle"
    bind $top <Alt-n> "$fo.nocase toggle"
    bind $top <Alt-l> "$fo.line toggle"
    bind $top <Alt-k> "$fo.lineanchor toggle"
    bind $top <Alt-m> "$fo.linestop toggle"
    bind $top <Alt-i> "$fo.inline toggle"
    bind $top <Alt-z> [list [self] clear]

    bind $data(w:regexp) <Control-Key> { # nothing }
    bind $data(w:regexp) <Alt-Key> { # nothing }
    bind $data(w:regexp) <Meta-Key> { # nothing }
    bind $data(w:regexp) <Mod1-Key> { # nothing }
    bind $data(w:regexp) <Key> [list [self] undo:regexp:compute %W %K %A]

    bind $data(w:replace) <Control-Tab> "$data(w:replace) insert insert {\\t}; break;"
    bind $data(w:sample) <Control-Tab> "$data(w:sample) insert insert {\t}; break;"
    # special for regexp Ctrl+letter = \<letter>
    bind $data(w:regexp) <Control-Tab> "$data(w:regexp) insert insert {\\t}; break;"
    foreach key {a b B e f n r t v u x 0 d D s S w W A Z m M y Y} {
        bind $data(w:regexp) <Control-$key> "$data(w:regexp) insert insert {\\$key}; break;"
    }
    foreach key {a b B e f n r t v u x 0} {
        bind $data(w:replace) <Control-$key> "$data(w:replace) insert insert {\\$key}; break;"
    }

    bind Text <Control-v> {}

    if {0} {
        # font selection popup
        foreach w {regexp replace sample} {
            set m [menu $top.fonts_$w -tearoff 0]
            foreach f $fonts {
                if {$f == "----"} {
                    $m add separator
                } else {
                    $m add command -label $f -command "$data(w:$w) configure -font [list $f]"
                }
            }
            bind $data(w:$w) <3> "tk_popup $m %X %Y"
        }
    }
}

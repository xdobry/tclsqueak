IDE::RegexpBrowser instproc make-regexp {} {
    my instvar data
    IDE::RegexpBrowser instvar font_regexp
    # new dialog
    catch { destroy .mkregexp }
    set w [toplevel .mkregexp]
    wm title $w "Make regexp"
    wm geometry $w 640x480
    # widgets
    set f [frame $w.top]
    # area to input words
    label $f.l1 -text "Words list:"
    set list [text $f.list -wrap char -bg white -font $font_regexp  -selectbackground lightblue -selectborderwidth 0  -width 1 -height 10 -bd 1 -yscrollcommand "$f.sy1 set"]
    scrollbar $f.sy1 -command "$list yview" -orient vertical -bd 1
    # button to compute the regexp
    set doit [button $f.doit -text "Compute" -width 15 -bd 1 -command [list [self] make-regexp:compute]]
    # display result
    label $f.l2 -text "Regexp:"
    set output [text $f.output -wrap char -bg white -font $font_regexp  -selectbackground lightblue -selectborderwidth 0  -width 1 -height 4 -bd 1 -yscrollcommand "$f.sy2 set"]
    bindtags $output "$output all"
    scrollbar $f.sy2 -command "$output yview" -orient vertical -bd 1
    # layout
    grid $f.l1	$list		$f.sy1		-sticky news
    grid $doit	-			-			-sticky ns -pady 2
    grid $f.l2	$output	$f.sy2		-sticky news
    grid columnconfigure $f {1} -weight 1
    grid rowconfigure $f {0 2} -weight 1
    # init
    set data(w:make:list) $list
    set data(w:make:output) $output
    # button OK / CANCEL
    set ff [frame $w.bottom]
    set ok [button $ff.ok -text "Insert into regexp" -width 20 -bd 1 -command [list [self] make-regexp:ok $w]]
    set cancel [button $ff.cancel -text "Cancel" -width 20 -bd 1 -command [list destroy $w]]
    pack $ok $cancel -side left -fill both -padx 10 -pady 10
    # layout
    pack $f -side top -expand true -fill both
    pack $ff -side bottom -anchor c
}

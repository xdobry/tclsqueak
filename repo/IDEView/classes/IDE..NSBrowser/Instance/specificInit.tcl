IDE::NSBrowser instproc specificInit {} {
    my instvar win ignoreXotcl introProxy

    set ignoreXotcl 1
    my requireNamespace

    panedwindow $win.panedwindow -orient vertical
    panedwindow $win.upperarea -orient horizontal

    if {![info exists introProxy] || $introProxy eq ""} {
        IDE::NSIntroProxy create [self]::@introproxy
        set introProxy [self]::@introproxy
    } else {
        if {[$introProxy hasclass IDE::NSIntroProxyInterp]} {
            my setTitleAddition "interpreter: [$introProxy set interp]"
        }
    }

    IDE::NSView create [self]::@nsview $win.nsview -height 25
    IDE::NSElements create [self]::@elements $win.elements
    IDE::MethodEdit create [self]::@edit $win.edit -width 40 -introProxy $introProxy


    $win.upperarea add $win.nsview  -width 200
    $win.upperarea add $win.elements -width 240

    $win.panedwindow add $win.upperarea -sticky news -height  220
    $win.panedwindow add $win.edit -sticky news -height 200

    pack $win.panedwindow -fill both -expand yes

    my initStatusBar -1

    my initContents
}

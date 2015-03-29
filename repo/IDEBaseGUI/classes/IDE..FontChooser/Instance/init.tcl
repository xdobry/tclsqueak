IDE::FontChooser instproc init {} {
    next

    my instvar win entry width font fontSize
    my requireNamespace
    if {[lsearch [font names] fontchooser]==-1} {
        font create fontchooser
    }
    my extractFontParameters

    frame $win.f
    label $win.f.lfamily -text "Font Family:"
    IDE::NListView create [self]::fontfamily $win.f.fontfamily  -notify [self] -notifyProc selectFontFamily
    label $win.f.lsize -text "Size:"
    spinbox $win.f.size -from -30 -to 30 -increment 1 -command [list [self] changeSize] -validate focusout  -validatecommand [list [self] validateSize %s] -invalidcommand [list [self] invalidSize]
    $win.f.size set $fontSize

    checkbutton $win.f.bold -text "Bold" -variable [self]::weight -onvalue bold -offvalue normal -command [list [self] changeOption weight]
    checkbutton $win.f.italian -text "Italian" -variable [self]::slant -onvalue italic -offvalue roman -command [list [self] changeOption slant]
    checkbutton $win.f.onlytk -text "Only Tk system fonts"  -variable [self]::onlytk  -command [list [self] changeFamiliesVisibility]


    labelframe $win.f.preview -text "Preview" -height 80 -width 300
    label $win.f.preview.text -text {AaBbCc123 \{([?} -font fontchooser
    pack $win.f.preview.text -fill x -expand yes
    pack propagate $win.f.preview 0

    grid $win.f.lfamily -column 0 -row 0 -sticky w
    grid $win.f.fontfamily -column 0 -row 1 -sticky news -rowspan 4
    grid $win.f.lsize -column 1 -row 0 -sticky w
    grid $win.f.size -column 1 -row 1 -sticky wne -padx 5
    grid $win.f.bold -column 1 -row 2 -sticky w
    grid $win.f.italian -column 1 -row 3 -sticky w
    grid $win.f.onlytk -column 1 -row 4 -columnspan 2 -sticky wn
    grid $win.f.preview -column 0 -row 5 -columnspan 2 -sticky news
    grid rowconfigure $win.f 4 -weight 1
    grid columnconfigure $win.f 0 -weight 1

    pack $win.f -fill both -expand yes -before $win.buttons
    my initView
    wm deiconify $win
}

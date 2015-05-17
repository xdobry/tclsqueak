IDE::CompBrowser instproc specificInit {} {
    my instvar win vtype statusBarTextWin

    set vtype Source

    # The simplest factory pattern case in the free world
    if {[IDE::System isDatabase]} {
        set postFix DB
    } else {
        set postFix ""
    }

    panedwindow $win.panedwindow -orient vertical
    panedwindow $win.upperarea -orient horizontal
    panedwindow $win.lowerarea -orient horizontal

    IDE::Toolbar create [self]::@toolbar $win.toolbar
    my @toolbar addCommand "New" [list [self] newAction] new_wiz 1.0
    my @toolbar addCommand "Save/Accept" [list [self]::methodedit dispatchTab save] save_edit 1.2
    my @toolbar addSeparator 1.3
    my @toolbar addCommand "Find/Replace" [list [self]::methodedit findReplace] find 2.0
    my @toolbar addCommand "Cut" [list [self]::methodedit dispatchTab cut] cut_edit 2.1
    my @toolbar addCommand "Copy" [list [self]::methodedit dispatchTab copy] copy_edit 2.2
    my @toolbar addCommand "Paste" [list [self]::methodedit dispatchTab paste] paste_edit 2.3
    my @toolbar addCommand "Check Syntax" [list [self]::methodedit dispatchTab syntaxCheck] refresh 2.4
    my @toolbar addSeparator 2.4
    my @toolbar addCommand "Search" [list [self] searchAction] search 3.0
    my @toolbar addCommand "Last Edited" [list [self]::@codecontroller showLastEdited] last_edit_pos 3.1
    my @toolbar addCommand "Back" [list [self]::@codecontroller backNavigation] backward_nav 3.2
    my @toolbar addCommand "Forward" [list [self]::@codecontroller forwardNavigation] forward_nav 3.3

    IDE::CompView${postFix} create [self]::@compview $win.upperarea.appview -focusKey {Alt-KeyPress-1} -nextFocus $win.upperarea.classview.listbox -prevFocus $win.upperarea.methodview.listbox -height 1
    IDE::MethodEditNotebook [self]::methodedit $win.methodedit

    IDE::ClassView${postFix} create [self]::classview $win.upperarea.classview -focusKey {Alt-KeyPress-2} -label {Classes/Objects Alt-2} -nextFocus $win.upperarea.methodcatview.listbox -prevFocus $win.upperarea.appview.listbox  -height 1
    IDE::MethodCategoryView create [self]::methodcatview $win.upperarea.methodcatview -focusKey {Alt-KeyPress-3} -label {Categories Alt-3} -nextFocus $win.upperarea.methodview.listbox -prevFocus $win.upperarea.classview.listbox  -height 1
    IDE::MethodView${postFix} create [self]::methodview $win.upperarea.methodview  -focusKey {Alt-KeyPress-4} -label {Methods Alt-4} -prevFocus $win.upperarea.methodcatview.listbox -nextFocus $win.methodedit.text -multiselect 1 -height 1

    $win.upperarea add $win.upperarea.appview  -width 200
    $win.upperarea add $win.upperarea.classview -width 240
    $win.upperarea add $win.upperarea.methodcatview $win.upperarea.methodview -width 200

    $win.lowerarea add $win.methodedit -width 500 -stretch first

    IDE::CommentEdit create [self]::@comment  $win.comment -height 50

    $win.panedwindow add $win.upperarea -sticky news -height  220
    $win.panedwindow add $win.lowerarea -sticky news -height  220
    #$win.panedwindow add $win.methodedit -sticky news -height 200

    pack $win.toolbar -fill x
    pack $win.panedwindow -expand yes -fill both

    my initStatusBar 2 4

    set find [IDE::DirectFind create [self]::@find $statusBarTextWin.find {}]
    $find packInto $statusBarTextWin

    IDE::CBCodeController create [self]::@codecontroller

    next
}

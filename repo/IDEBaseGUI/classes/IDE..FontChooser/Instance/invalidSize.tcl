IDE::FontChooser instproc invalidSize {} {
    my instvar fontSize win
    $win.f.size set $fontSize
    $win.f.size configure -validate focusout
}

IDE::FontChooser instproc changeSize {} {
    my instvar win fontSize
    set fontSize [$win.f.size get]
    font configure fontchooser -size $fontSize
}

IDE::MenuStruct instproc showPopMenu {win x y} {
    my checkPopDownEnablement $win
    tk_popup $win $x $y
}

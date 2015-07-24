IDE::ProgEdit instproc initBindings {} {
    next
    set twin [my getTextWindow]
    # this does not work <Shift-Key-Tab>
    # Problems with winows ISO_Left_Tag ist not defined
    # catch {bind $twin <Key-ISO_Left_Tab> "if {\[[self] tabShiftPress\]} break"}
    bind $twin <KeyRelease-Return> [list [self] keyReturn]
    bind $twin <Return> [list [self] set beginReturn 1]
    bind $twin <KeyPress-Tab> [list handleTabPress [self] %s]
    bind $twin <Control-KeyPress-space> [list [self] codeCompletion]
    bind $twin <Double-Button-1> [list handleDoublePress [self]]
    bind $twin <KeyRelease> [list [self] checkInsertSpecialChar]
    bind $twin <ButtonRelease-1> [list [self] checkInsertSpecialChar]
    bind $twin <<Selection>> [list [self] selectionDuplicateMark]

}

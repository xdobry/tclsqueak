IDE::MethodEdit instproc saveForce {} {
    if {![my exists oldtext]} return
    set newtext [my getText]
    if {[my set oldtext] ne $newtext} {
        # !!! no handling of comments
        [my set controler] editSave $newtext [my getContentDescr]
        [my getTextWindow] edit modified 0
    }
}

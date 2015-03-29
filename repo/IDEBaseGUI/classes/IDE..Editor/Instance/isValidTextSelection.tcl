IDE::Editor instproc isValidTextSelection {} {
    expr {[my getSelection] ne ""}
}

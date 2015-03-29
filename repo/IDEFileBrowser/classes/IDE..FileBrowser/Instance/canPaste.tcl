IDE::FileBrowser instproc canPaste {} {
    expr {[my exists action] && [my set action] ne ""}
}

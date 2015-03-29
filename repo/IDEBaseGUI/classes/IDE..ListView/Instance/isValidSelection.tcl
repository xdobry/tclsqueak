IDE::ListView instproc isValidSelection {} {
    expr {[[my set win].listbox curselection] ne ""}
}

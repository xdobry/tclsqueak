IDE::Text instproc setCursorPos pos {
    [my set win].text mark set insert "1.0 + $pos char"    
}

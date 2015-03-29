IDE::FontChooser instproc initView {} {
    [self]::fontfamily setList [font families]
    [self]::fontfamily setSelectedItem [my set fontFamily] 0
}

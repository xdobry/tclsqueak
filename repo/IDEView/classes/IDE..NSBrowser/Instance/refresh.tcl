IDE::NSBrowser instproc refresh {} {
    [self]::@nsview reset
    my initContents
}

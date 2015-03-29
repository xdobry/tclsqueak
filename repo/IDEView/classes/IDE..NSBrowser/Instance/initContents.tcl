IDE::NSBrowser instproc initContents {} {
    [self]::@nsview setHList [list [concat :: [my getNamespacesAsList ::]]]
    [self]::@nsview openLevel 1
}

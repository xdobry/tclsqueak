IDE::CommentScanerBrowser instproc readDir {{dir {}}} {
    my instvar win actualDir
    set actualDir $dir
    $win.dir.dirname configure -text $dir
    set names [ide::lcollect each [glob [file join $dir *]] {set each [file tail $each]}]
    [self]::files setList $names
}

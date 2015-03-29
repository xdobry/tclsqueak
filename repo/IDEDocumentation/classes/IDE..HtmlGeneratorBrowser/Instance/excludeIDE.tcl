IDE::HtmlGeneratorBrowser instproc excludeIDE {} {
    set idecore [concat [IDE::System getCoreComponentsAll] [IDE::System getExtraComponents]]
    foreach index [[self]::components selectedIndex] item [[self]::components selectedItem] {
        if {[ide::lcontain $idecore $item]} {
            [self]::components removeSelection $index $index
        }
    }
}

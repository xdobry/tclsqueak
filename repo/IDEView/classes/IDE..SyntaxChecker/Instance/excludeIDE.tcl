IDE::SyntaxChecker instproc excludeIDE {} {
    set idecore [concat [IDE::System getCoreComponentsAll] [IDE::System getExtraComponents]]
    foreach index [[self]::components selectedIndex] item [[self]::components selectedItem] {
        if {$item in $idecore} {
            [self]::components removeSelection $index $index
        }
    }
}

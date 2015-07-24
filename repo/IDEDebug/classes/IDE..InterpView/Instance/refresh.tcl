IDE::InterpView instproc refresh {} {
    my instvar win
    my reset
    foreach i [interp slaves] {
        my insertForParent {} $i
    }
}

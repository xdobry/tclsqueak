IDE::XOIntroProxy instproc parseClassDefinition body {
    set superclasses [list]
    set parameters [list]
    foreach {par value} [lrange $body 2 end] {
        switch -- $par {
            -superclass {
                set superclasses $value
            }
            -parameter {
                set parameters $value
            }
        }
    }
    list $superclasses $parameters
}

IDE::DocGeneratorMain instproc componentsList {} {
    my instvar components
    set listCont {}
    foreach comp $components {
        append listCont [my generateDocForComponent $comp] \n
    }
    return $listCont
}

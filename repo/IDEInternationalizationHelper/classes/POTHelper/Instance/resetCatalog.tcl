POTHelper instproc resetCatalog {} {
    my instvar catalog
    set catalog [list]
    my setItem 0
}

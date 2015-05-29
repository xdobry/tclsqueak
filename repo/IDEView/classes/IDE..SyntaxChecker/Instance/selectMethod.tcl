IDE::SyntaxChecker instproc selectMethod item {
    my instvar errors errorsArr
    set errors $errorsArr($item)
    [self]::@codecontroller setBodyText {*}[IDE::XOIntroProxy getDescFromDisplayItem $item]
    [self]::messages setListUnsorted [ide::lcollect each $errors {lindex $each 2}]
    # !!! no save controller
}

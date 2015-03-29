IDE::SyntaxChecker instproc selectMethod item {
    my instvar errors errorsArr
    set errors $errorsArr($item)
    [self]::body setTextType [my getBodyForItem $item] xotcl
    [self]::messages setListUnsorted [ide::lcollect each $errors {lindex $each 2}]
    # !!! no save controller
}

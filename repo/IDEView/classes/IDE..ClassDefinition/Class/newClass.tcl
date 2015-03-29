IDE::ClassDefinition proc newClass view {
    return [my new [Object autoname .cdbrowser] -classView $view]
}

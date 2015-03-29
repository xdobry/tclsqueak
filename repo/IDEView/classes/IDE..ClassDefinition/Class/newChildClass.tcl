IDE::ClassDefinition proc newChildClass {superclass view} {
    return [my new [Object autoname .cdbrowser] -classView $view -superclassList $superclass]
}

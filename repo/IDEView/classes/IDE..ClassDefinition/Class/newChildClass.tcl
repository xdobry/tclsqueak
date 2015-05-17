IDE::ClassDefinition proc newChildClass {superclass view compObj} {
    return [my new [Object autoname .cdbrowser] -classView $view -superclassList $superclass -compObj $compObj]
}

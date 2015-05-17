IDE::ClassDefinition proc newClass {view compObj} {
    return [my new [Object autoname .cdbrowser] -classView $view -compObj $compObj]
}

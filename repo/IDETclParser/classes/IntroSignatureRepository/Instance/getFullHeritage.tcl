IntroSignatureRepository instproc getFullHeritage {class {namespace {}}} {
    set fullCl [my getFullObjectName $class $namespace]
    if {[Object isobject $fullCl]} {
        return [concat $fullCl [$fullCl info heritage]]
    } else {
        return [list $fullCl]
    }
}

IDE::GuiClassBuilder instproc build desc {
    if {![dict exists $desc Component]} {
        error "can not get Component name"
    }
    if {![dict exists $desc Class]} {
        error "can not get Class name"
    }
    set component [dict get $desc Component]
    set class [dict get $desc Class]
    set namespace [dict get $desc namespace]
    if {$namespace ne ""} {
        if {[string range $namespace 0 1] ne "::"} {
            set namespace ::$namespace
            dict set desc namespace $namespace
        }
        if {[namespace qualifiers $class] ne ""} {
            if {[namespace qualifiers $class] ne $namespace} {
                error "namespace mismatch in class name is: '[namespace qualifiers $class]' expected: '$namespace'"
            }
        } else {
            set class ${namespace}::$class
        }
    }
    
    if {[IDE::XOIntroProxy getIntroProxyForObject $class] ne ""} {
        error "Class $class already exists"
    }
    set cobj [my createComponentIfNotExists $component $desc]
    my createClass $class $cobj
    my copyTemplateMethods IDE::GuiClassTemplate $class [$cobj getIntroProxy] $desc
    if {![$cobj isPersistent]} {
        IDE::ComponentPersistence importComponent $component
    }
}

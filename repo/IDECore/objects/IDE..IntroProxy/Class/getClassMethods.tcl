IDE::IntroProxy proc getClassMethods {class categories} {
    set methods {}
    foreach category $categories {
        lappend methods {*}[my getMethodsForCategoryBForObject $class $category]
    }
    return $methods
}

IDE::XOIntroProxy instproc getClassMethods {class {categories _all_categories}} {
    set methods {}
    foreach category $categories {
        lappend methods {*}[my getMethodsForCategoryBForObject $class $category]
    }
    return $methods
}

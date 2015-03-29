IDE::XOIntroProxy instproc getInstanceMethods {class {categories _all_categories}} {
    set methods {}
    foreach category $categories {
        lappend methods {*}[my getMethodsForCategoryBForObject $class $category {}]
    }
    return $methods
}

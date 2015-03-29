IDE::XOIntroProxy instproc getCategoriesForClass class {
    if {[$class istype Class]} {
        return [my getCategoriesBForObject $class {}]
    }
    return all_categories
}

IDE::TclOOIntroProxy instproc getCategoriesForClass class {
    if {[info object isa class $class]} {
        return [my getCategoriesBForObject $class {}]
    }
    return all_categories
}

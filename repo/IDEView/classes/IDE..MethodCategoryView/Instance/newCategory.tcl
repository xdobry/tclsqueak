IDE::MethodCategoryView instproc newCategory {} {
    my instvar viewtype vclass
    set newname [IDE::IDialogEntry getValue {enter new category name. Consider you can create and assign method to new category in one step. Menu Method->move to category}]
    if {$newname eq ""} return
    if {$newname in [my getList]} {
        IDE::Dialog message "Category $newname already exists!"
        return
    }
    set introProxy [my getIntroProxy]
    if {$viewtype eq "Instance"} {
        $introProxy addCategoryBForObject $vclass $newname {}
    } elseif {$viewtype eq "Class"} {
        $introProxy addCategoryBForObject $vclass $newname
    }
    my refreshView
}

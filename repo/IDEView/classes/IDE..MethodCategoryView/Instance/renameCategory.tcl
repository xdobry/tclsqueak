IDE::MethodCategoryView instproc renameCategory actual {
    my instvar viewtype vclass
    set newname [::IDE::IDialogEntry getValue {type the new name} $actual]
    if {$newname eq "" || $newname eq $actual} return
    set introProxy [my getIntroProxy]
    if {$viewtype eq "Instance"} {
        $introProxy renameCategoryBForObject $vclass $actual $newname {}
    } elseif {$viewtype eq "Class"} {
        $introProxy renameCategoryBForObject $vclass $actual $newname
    }
    my renameItem $actual $newname
}

IDE::MethodCategoryView instproc deleteCategory actual {
    my instvar viewtype vclass
    set introProxy [my getIntroProxy]
    if {$viewtype eq "Instance"} {
        regexp {(.+) \([0-9]+\)} $actual _ c
        $introProxy deleteCategoryBForObject $vclass $c {}
    } elseif {$viewtype eq "Class"} {
        regexp {(.+) \([0-9]+\)} $actual _ c
        $introProxy deleteCategoryBForObject $vclass $c
    }
    my refreshView
}

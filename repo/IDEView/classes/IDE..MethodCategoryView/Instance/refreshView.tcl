IDE::MethodCategoryView instproc refreshView {} {
    my instvar vclass win vobjtype viewtype
    set introProxy [my getIntroProxy]
    [self]::stateButton setStateAddInfo Class [format %2i [llength [$introProxy getClassMethods $vclass]]]
    if {$vobjtype eq "Classes"} {
        [self]::stateButton setStateAddInfo Instance [format %2i [llength [$introProxy getInstanceMethods $vclass]]]
    }
    set allcatName _all_categories
    if {$viewtype eq "Instance"} {
        set categories [$introProxy getCategoriesForClass $vclass]
        set catWithCount [list]
        foreach c $categories {
            set item [list $c ([llength [$introProxy getInstanceMethods $vclass [list $c]]])]
            if {$c eq "_all_categories"} {
                set allcatName $item
            }
            lappend catWithCount $item
        }
        my setList $catWithCount
    } elseif {$viewtype eq "Class"} {
        set categories [$introProxy getCategoriesForObject $vclass]
        set catWithCount [list]
        foreach c $categories {
            set item [list $c ([llength [$introProxy getClassMethods $vclass [list $c]]])]
            if {$c eq "_all_categories"} {
                set allcatName $item
            }
            lappend catWithCount $item
        }
        my setList $catWithCount
    }
    return $allcatName
}

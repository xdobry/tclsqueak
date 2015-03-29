IDE::MethodView instproc moveToCategory methods {
    my instvar vclass vcategories vtype
    set tcategories [[my info parent]::methodcatview set listItems]
    set categories [list]
    foreach c $tcategories {
        regexp {(.+) \([0-9]+\)} $c _ c
        lappend categories $c
    }
    IDE::IDialogListEntry create [self]::dialog -message {Choose the category or name the new one} -list $categories
    if {[[self]::dialog prompt] eq "ok"} {
        set cat [[self]::dialog getvalue]
        if {$cat ne ""} {
            if {$vcategories ne $cat} {
                set introProxy [my getIntroProxy]
                foreach method $methods {
                    if {$vtype eq "Instance"} {
                         $introProxy moveToCategoryBForObject $vclass $method $cat {}
                    } else {
                         $introProxy moveToCategoryBForObject $vclass $method $cat
                    }
                    if {$vcategories ne "_all_categories"} {
                        my removeItem $method
                    }
                }
                [my info parent]::methodcatview refreshView
            }
        }
    }
    [self]::dialog destroy
}

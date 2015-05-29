IDE::HierarchyPanel instproc init twin {
    my instvar win hclassview currentItem hierarchyHistory hierarchyType
    set win $twin
    ttk::frame $win
    
    set currentItem ""
    set hierarchyHistory [list]
    set hierarchyType heritage
    
    set toolbar [IDE::Toolbar create [self]::@toolbar $win.toolbar]
    
    $toolbar addRadiobutton "Show Super Types" [list [self] changeViewType] [self]::hierarchyType heritage super_co 1.0
    $toolbar addRadiobutton "Show Sub Types" [list [self] changeViewType] [self]::hierarchyType children sub_co 1.1
    
    $toolbar addCommand "Refresh" [list [self] refresh] refresh 2.0
    $toolbar addCommand "Search History" [list [self] history] history_list 2.1
    $toolbar addCommand "Detach Window" [list [self] detachHierarchy] main_tab 2.2
    
    set hclassview [IDE::HeritageClassView create [my info parent]::@hclassview $win.classview -mixin IDE::PopdownOnlyMix -label {} -masterView [my info parent] -height 6]
    pack $win.classview -fill both -expand yes -side bottom
    pack $win.toolbar -side right
}

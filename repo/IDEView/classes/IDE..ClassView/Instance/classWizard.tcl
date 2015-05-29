IDE::ClassView instproc classWizard mode {
    set actual [my selectedItem]
    set codeController [my info parent]::@codecontroller
    if {![Object isobject $codeController]} {
        set codeController [self]   
    }
    switch $mode {
        new {
            my setViewType {Classes}
            IDE::ClassDefinition newClass $codeController [my getActualComponentObject]
        }
        newChild {
            if {$actual eq ""} return
            IDE::ClassDefinition newChildClass $actual $codeController [my getActualComponentObject]
        }
        redefine {
            if {$actual eq ""} return
            IDE::ClassDefinition redefineClass $actual $codeController [my getActualComponentObject]
        }
    }
}

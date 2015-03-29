IDE::ClassView instproc classWizard mode {
    set actual [my selectedItem]
    switch $mode {
        new {
            my setViewType {Classes}
            IDE::ClassDefinition newClass [self]
        }
        newChild {
            if {$actual eq ""} return
            IDE::ClassDefinition newChildClass $actual [self]
        }
        redefine {
            if {$actual eq ""} return
            IDE::ClassDefinition redefineClass $actual [self]
        }
    }
}

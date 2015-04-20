IDE::CompViewDB instproc createNewComponent {component ootype namespace installInRepo} {
    next
    if {$installInRepo} {
        IDE::ComponentPersistence importComponent $component
    }
    IDE::System refreshComponentView $component
}

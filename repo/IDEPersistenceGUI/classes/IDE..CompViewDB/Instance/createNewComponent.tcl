IDE::CompViewDB instproc createNewComponent {component ootype namespace} {
    next
    if {[IDE::Dialog yesNo "Should the component $component be installed in database for versioning system"] eq "yes"} {
        IDE::ComponentPersistence importComponent $component
    }
    IDE::System refreshComponentView $component
}

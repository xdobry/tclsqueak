IDE::CompRequiredView proc showRequirements component {
    set required [$component getRequiredFrom]
    set listchooser [IDE::IDialogListChooser new -volatile -message "Requirements for [$component getName]" -listout $required -listin [IDE::Component getComponentNames]]
    set ret [$listchooser prompt]
    if {$ret ne "cancel"} {
        $component setRequirements [$listchooser set listout]
    }
}

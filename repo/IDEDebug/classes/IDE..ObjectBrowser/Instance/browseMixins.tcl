IDE::ObjectBrowser instproc browseMixins {} {
    my instvar vobject introProxy

    set listchooser [IDE::IDialogListOrderChooser new -volatile -message "Mixin Classes for $vobject" -listout [$introProxy getObjectMixins $vobject] -listin [$introProxy getClasses]]

    set ret [$listchooser prompt]
    if {$ret ne "cancel"} {
        $vobject setObjectMixins [$listchooser set listout]
    }
}

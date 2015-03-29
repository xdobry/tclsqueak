IDE::ConfigmapControler proc initializeAfterLoad {} {
    if {$::xotcl::version>=1.3} {
        my mixin add IDE::EventHandlerMix
    } else {
        my mixinappend IDE::EventHandlerMix
    }
}

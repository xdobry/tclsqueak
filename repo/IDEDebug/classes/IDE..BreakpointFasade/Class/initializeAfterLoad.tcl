IDE::BreakpointFasade proc initializeAfterLoad {} {
    my set breakPointClass IDE::BreakpointFasade
    IDE::BreakpointFasade mixin add IDE::EventHandlerMix
}

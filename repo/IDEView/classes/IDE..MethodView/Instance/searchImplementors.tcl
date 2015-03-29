IDE::MethodView instproc searchImplementors range {
    my instvar vclass
    set implementor [my selectedItemFirst]
    if {$implementor ne ""} {
        switch -- $range {
            local {IDE::MethodBrowser searchImplementorsClass $implementor $vclass [my getIntroProxy]}
            component {
                IDE::MethodBrowser searchImplementorsComponent $implementor [my getComponentInContext]
            }
            all {IDE::MethodBrowser searchImplementorsAll $implementor}
        }
    }
}

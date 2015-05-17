IDE::MethodView instproc getSearchScopeDict range {
    my instvar vclass
    set searchDict [dict create]
    switch $range {
        local {
            dict set searchDict scope object
            dict set searchDict context $vclass
            dict set searchDict introProxy [my getIntroProxy]
        }
        component {
            dict set searchDict scope component
            dict set searchDict context [my getComponentInContext]
        }
        all {
            dict set searchDict scope all
        }
    }
    return $searchDict
}

IDE::ConfigmapControler proc invokeAction {action view object} {
    set type [namespace tail $view]
    switch $action {
        {new Configmap} {my createNewGroup}
        add {
            switch $type {
                components {my addNewComponent}
                cmaps {my addNewConfigmap}
            }
        }
        {import from map} {
            if {[$object importFromMap]} {
                [my set view]::components setObjectsList [$object getComponents]
            }
        }
        {check order} {
            if {[$object reorderComponents]} {
                [my set view]::components setObjectsList [$object getComponents]
            }

        }
        {export to map} {
            $object exportToMap
        }
        {open in Map Browser} {
            $object openInConfigurationsMapBrowser
        }
        {save as packages} {
            $object saveAsPackages
        }
        changes {my browseChanges $object}
        remove {
            $view removeObject $object
            switch $type {
                components {
                    [my set selectedVersion]::components removeObject $object
                }
                cmaps {
                    [my set selectedVersion]::childconigmaps removeObject $object
                }
            }
        }
        version {my versionCMapEdition $object; $view refreshLabels}
        load {$object load; IDE::System signalComponentsChanged}
        {load and run} {$object loadAndRun; IDE::System signalComponentsChanged}
        info {$object viewInfo}
        inspect {$object inspect}
        view {$object viewEdition}
        {new edition} {
            set nconf [$object copyAndCreateNewEdition]
            $view insertObjectAt $nconf 0
            my addConfigmap $nconf
        }
        {release other} {
            switch $type {
                components {my changeEdtion $object components}
                cmaps {my changeEdtion $object cmaps}
            }
        }
        {set newest editions} {
            $object setNewestEdtions
            my selectVersion $object
        }
    }
}

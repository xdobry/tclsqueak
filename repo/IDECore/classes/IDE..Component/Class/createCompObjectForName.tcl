IDE::Component proc createCompObjectForName {component {ootype XOTcl} {namespace {}}} {
    if {[my exists components($component)]} {
        error "component $component already exists"
    } else {
        set appObj [IDE::Component new -name $component]
        if {$ootype ne ""} {
            $appObj setOOType $ootype
        }
        if {$namespace ne ""} {
            if {[string range $namespace 0 1] ne "::"} {
                error "namespace for component must have :: prefix but is $namespace"
            }
            if {![namespace exists $namespace]} {
                # create namespace
                namespace eval $namespace {}
            }
            $appObj set namespace $namespace
        }
        my set components($component) $appObj
        if {[catch { set version [package present $component] }]} {
            set version 0.1
        }
        $appObj set version $version
        return $appObj
    }
}

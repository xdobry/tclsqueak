IDE::Component proc getCompObjectForName {component {ootype XOTcl}} {
    if {[my exists components($component)]} {
        return [my set components($component)]
    } else {
        set appObj [IDE::Component new -name $component]
        if {$ootype ne ""} {
            $appObj setOOType $ootype
        }
        my set components($component) $appObj
        if {[catch { set version [package present $component] }]} {
            set version 0.1
        }
        $appObj set version $version
        return $appObj
    }
}

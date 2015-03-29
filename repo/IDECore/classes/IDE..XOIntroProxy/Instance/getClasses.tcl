IDE::XOIntroProxy instproc getClasses {} {
    if {[IDE::System isIgnoreIDEComponents]} {
        set ret {}
        foreach comp [my getComponentsNoIDE] {
            set cobj [IDE::Component  getCompObjectForNameIfExist $comp]
            if {$cobj ne ""} {
                lappend ret {*}[$cobj getClasses]
            }
        }
    } else {
        set ret [Class info instances]
        foreach cls [my getSubclassesDeep Class] {
            lappend ret {*}[$cls info instances]
        }
    }
    set rret [list]
    foreach o $ret {
        if {$o ni {xotcl::classInfo xotcl::objectInfo package}} {
            lappend rret $o
        }
    }
    return $rret
}

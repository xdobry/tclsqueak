IDE::XOIntroProxy instproc getObjects {} {
    set ret {}
    if {[IDE::System isIgnoreIDEComponents]} {
        foreach comp [my getComponentsNoIDE] {
            set cobj [IDE::Component  getCompObjectForNameIfExist $comp]
            set ret [concat $ret [$cobj getObjects]]
        }
    } else {
        foreach o [Object info instances] {
            if {[string trimleft $o :] ni {xotcl::classInfo xotcl::objectInfo package}} {
                lappend ret $o
            }
        }
    }
    return $ret
}

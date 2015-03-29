IDE::Component proc saveAllToPath {} {
    if {[IDE::System isIgnoreIDEComponents]} {
        set apps [list]
        set introProxy [IDE::XOIntroProxy getIntroProxy]
        foreach c [$introProxy getComponentsNoIDE] {
            lappend apps [IDE::Component getCompObjectForNameIfExist $c]
        }
    } else {
        set apps [my getAllComponents]
    }
    foreach app $apps {
        if {[$app getName] eq "core"} continue
        if {[string match xotcl::* [$app getName]]} continue
        $app saveAsScript
    }
}

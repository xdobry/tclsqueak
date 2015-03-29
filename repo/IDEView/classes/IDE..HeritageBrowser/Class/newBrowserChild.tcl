IDE::HeritageBrowser proc newBrowserChild {{tclass {}} {introProxy {}}} {
    set class $tclass
    if {$class eq ""} {
        set class [IDE::ClassSelector getClass]
        if {$class eq ""} return
    }
    set newinst [my create [Object autoname browser] [Object autoname .browser] -vtype children]
    $newinst browse $class $introProxy
    return $newinst
}

IDE::HeritageBrowser proc newBrowser {{tclass {}} {introProxy {}}} {
    set class $tclass
    if {$class eq ""} {
        set class [IDE::ClassSelector getClass]
        if {$class eq ""} return
    }
    set newinst [my new [Object autoname .heritagebrowser]]
    $newinst browse $class $introProxy
    return $newinst
}

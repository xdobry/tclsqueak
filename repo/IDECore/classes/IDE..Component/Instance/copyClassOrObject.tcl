IDE::Component instproc copyClassOrObject {object newname {compName {}}} {
    set introProxy [my getIntroProxy]
    $introProxy copyObjectTo $object $newname
    if {$compName eq ""} {
        set compName [my getName]
    }
    $introProxy moveToComponent $newname $compName
}

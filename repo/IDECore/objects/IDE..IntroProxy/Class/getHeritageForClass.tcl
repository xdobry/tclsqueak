IDE::IntroProxy proc getHeritageForClass class {
    set hlist [$class]
    foreach sclass [$class info superclass] {
	if {$sclass eq "::Object" || $sclass eq "::xotcl::Object"} continue
	lappend hlist [my getHeritageForClass $sclass]
    }
    return $hlist
}

IDE::SystemConfigMap proc asScript {} {
    set script {}
    append script "set preStartScript [list [my getValueForType preStartScript]]\n"
    append script "set componentsToLoad [list [my getValueForType componentsToLoad]]\n"
    append script "set startScript [list [my getValueForType startScript]]\n"
    return $script
}

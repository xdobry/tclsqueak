IDE::Component::Tracker proc trackClass class {
    $class mixin add [self]
    my lappend trackedClasses $class
}

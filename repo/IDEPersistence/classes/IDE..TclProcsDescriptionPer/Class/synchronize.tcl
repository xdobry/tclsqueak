IDE::TclProcsDescriptionPer proc synchronize {obj id} {
    if {$::xotcl::version>=1.3} {
        $obj mixin add [self]
    } else {
        $obj mixinappend [self]
    }
    $obj synchronizeWithId $id
}

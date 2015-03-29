IDE::ObjectDescription instproc hasMethodComment {type method} {
    if {![my istype IDE::DBInfo] && ![my istype IDE::Component]} {
        [my getDescription] hasMethodComment $type $method
    } else {
        set mdesc [my get${type}MethodIfExist $method]
        if {$mdesc eq ""} { error "Unknown Method $method"}
        $mdesc hasComment
    }
}

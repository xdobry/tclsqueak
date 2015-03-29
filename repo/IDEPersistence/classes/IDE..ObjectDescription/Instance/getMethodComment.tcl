IDE::ObjectDescription instproc getMethodComment {type method} {
    if {![my istype IDE::DBInfo] && ![my istype IDE::Component]} {
        [my getDescription] getMethodComment $type $method
    } else {
        set mdesc [my get${type}MethodIfExist $method]
        if {$mdesc eq ""} {
            error "Unknown Method [self] $type>>$method"
        }
        $mdesc getComment
    }
}

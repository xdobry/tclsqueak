IDE::ObjectDescription instproc setMethodComment {type method text} {
    if {![my istype IDE::DBInfo] && ![my istype IDE::Component]} {
        [my getDescription] setMethodComment $type $method $text
    } else {
        set mdesc [my get${type}MethodIfExist $method]
        if {$mdesc eq ""} { error "Unknown Method $method $type"}
        $mdesc setComment $text
    }
}

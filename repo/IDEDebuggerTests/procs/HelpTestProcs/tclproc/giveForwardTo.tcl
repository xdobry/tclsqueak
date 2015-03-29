proc giveForwardTo {obj method} {
    set a 0
    incr a 1
    $obj $method
    incr a -1
}

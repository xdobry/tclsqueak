IDE::MethodView instproc prepareNewMethodState {} {
    my unselect
    [my info parent]::methodedit focus
    # We want to change state to Source but do not provoke events
    # quite dirty
    [my info parent]::methodedit set vtype Source
    set sb [my info parent]::stateButton
    if {[Object isobject $sb]} {
        $sb setActivity 0
        $sb changeStateTo Source 0
    }
}

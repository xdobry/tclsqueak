IDE::MethodEditNotebook instproc popMenuWindow {} {
    my instvar win
    set tabid [$win select]
    if {$tabid ne ""} {
        return $tabid
    } else {
        return $win
    }
}

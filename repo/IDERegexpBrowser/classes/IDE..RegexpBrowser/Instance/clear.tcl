IDE::RegexpBrowser instproc clear {} {
    my instvar winRegexp
    my history:add
    $winRegexp delete 1.0 end
    my go
}

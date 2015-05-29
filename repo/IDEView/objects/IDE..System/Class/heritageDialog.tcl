IDE::System proc heritageDialog master {
    set class [IDE::ClassSelector getClass]
    if {$class eq ""} return
    $master showHierarchy $class [IDE::XOIntroProxy getIntroProxyForObject $class] heritage
}

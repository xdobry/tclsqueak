IDE::IntroProxy proc getObjectsForComponent component {
    set appObj [IDE::Component getCompObjectForName $component]
    return [$appObj getObjects]
}

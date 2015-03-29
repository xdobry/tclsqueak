IDE::IntroProxy proc getClassesForComponent component {
    set appObj [IDE::Component getCompObjectForName $component]
    return [$appObj getClasses]
}

IDE::IntroProxy proc getProcsGroupsForComponent component {
    set appObj [IDE::Component getCompObjectForName $component]
    return [$appObj getProcsGroups]
}

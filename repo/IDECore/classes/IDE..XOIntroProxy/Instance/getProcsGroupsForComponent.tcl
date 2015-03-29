IDE::XOIntroProxy instproc getProcsGroupsForComponent component {
    set appObj [IDE::Component getCompObjectForName $component]
    return [$appObj getProcsGroups]
}

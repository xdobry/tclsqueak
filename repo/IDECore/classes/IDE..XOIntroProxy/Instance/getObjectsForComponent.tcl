IDE::XOIntroProxy instproc getObjectsForComponent component {
    set appObj [IDE::Component getCompObjectForName $component]
    return [$appObj getObjects]
}

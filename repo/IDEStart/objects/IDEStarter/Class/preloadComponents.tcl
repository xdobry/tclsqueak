IDEStarter proc preloadComponents args {
    if { ![my exists preloadcomponents] } return
    foreach component [my set preloadcomponents] {
        IDE::ComponentPersistence loadNameVersionId $component [IDE::ComponentPersistence questIdForComponentName $component] {}
    }
    my unset preloadcomponents
}

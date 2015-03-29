IDE::ConfigmapControler proc addConfigmap cmap {
    my instvar configmapArr
    ide::addToValueForKeyAt configmapArr [$cmap name] $cmap 0
}

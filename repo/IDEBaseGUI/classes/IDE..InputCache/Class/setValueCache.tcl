IDE::InputCache proc setValueCache {cache value} {
    my instvar cacheArr
    set cacheArr($cache) $value
}

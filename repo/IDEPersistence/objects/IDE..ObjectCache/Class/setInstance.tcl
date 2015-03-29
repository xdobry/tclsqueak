IDE::ObjectCache proc setInstance instance {
    regsub -all :: [$instance info class] {} name
    set arrname cache_$name
    set pk [$instance getIdValue]
    my set ${arrname}($pk) $instance
}

IDE::ObjectCache proc removeInstance instance {
    regsub -all :: [$instance info class] {} name
    set arrname cache_$name
    catch {my unset ${arrname}([$instance getIdValue])}
}

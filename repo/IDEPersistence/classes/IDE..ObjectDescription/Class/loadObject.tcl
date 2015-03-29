IDE::ObjectDescription proc loadObject {objectId component} {
    my set loadingComponent $component
    set instance [[self]::descriptor createInstanceFromDB [self] $objectId]
    $instance loadAllMethods
    $instance trackingOn
    return $instance      
}

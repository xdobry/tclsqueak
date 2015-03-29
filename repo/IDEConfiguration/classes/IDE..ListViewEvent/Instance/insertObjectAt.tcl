IDE::ListViewEvent instproc insertObjectAt {obj pos} {
    my instvar objectsList
    set objectsList [linsert $objectsList $pos $obj]
    my addItemAt [$obj [my nameMethod]] $pos
}

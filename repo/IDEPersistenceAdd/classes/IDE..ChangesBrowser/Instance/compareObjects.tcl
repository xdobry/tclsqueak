IDE::ChangesBrowser instproc compareObjects {c1 c2} {
    my instvar obj1 obj2 vclass
    set obj1 $c1
    set obj2 $c2
    set name [$c1 getName]
    my setCompareLabels "$name [$c1 set objectid]" "$name [$c2 set objectid]"
    my changeViewType Instance
}

IDE::ObjectBrowser proc browseObjectsList {list {introProxy {}}} {
    set newinst [my create [Object autoname browser] [Object autoname .browser] -type list]
    $newinst setViewList $list
    return $newinst
}

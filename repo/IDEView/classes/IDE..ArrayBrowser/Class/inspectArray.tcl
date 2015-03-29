IDE::ArrayBrowser proc inspectArray {object array} {
    set br [my create [Object autoname abrowser] [Object autoname .abrowser] -vobject $object -varray $array]
    return $br
}

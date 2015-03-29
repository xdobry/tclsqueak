IDE::ArrayBrowser proc inspectGlobalArray {array {introProxy {}}} {
    set br [my create [Object autoname abrowser] [Object autoname .abrowser] [list -vobject {}] [list -varray $array] [list -introProxy $introProxy]]
    return $br
}

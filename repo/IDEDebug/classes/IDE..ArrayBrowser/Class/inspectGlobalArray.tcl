IDE::ArrayBrowser proc inspectGlobalArray {array {introProxy {}}} {
    set br [my new [Object autoname .abrowser] [list -vobject {}] [list -varray $array] [list -introProxy $introProxy]]
    return $br
}

IDE::Toolbar proc createImage name {
    if {[lsearch [image names] $name]<0} {
        my instvar imageCreators
        if {[info exists imageCreators]} {
            foreach creator $imageCreators {
                if {[$creator createImage $name]} {
                    return $name
                }
            }
        }
        my create[string toupper [string range $name 0 0]][string range $name 1 end]
    } else {
        return $name
    }
}

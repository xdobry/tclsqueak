IDE::TclOOIntroProxy instproc getMethodsForCategoryBForObject {object category {postFix Procs}} {
    if {$category eq "_all_categories"} {
        if {$postFix eq ""} {
	    set classmethods [info class methods $object]
            catch {
                if {[info class constructor $object] ne ""} {
                    lappend classmethods _constructor
                }
            }
            catch {
                if {[info class destructor $object] ne ""} {
                    lappend classmethods _destructor
                }
            }
            return $classmethods
	} else {
            return [info object methods $object]
        }
    } elseif {$category eq "_uncategorized"} {
        set allcategorized {}
        foreach c [my getMetadataForObject $object categoriesMethods$postFix] {
            set allcategorized [concat $allcategorized $c]
        }
        set all [my getMethodsForCategoryBForObject $object _all_categories $postFix]
        ide::lremoveAll all $allcategorized
        return $all
    }
    set catindex [my addCategoryBForObject $object $category $postFix]
    return [lindex [my getMetadataForObject $object categoriesMethods$postFix] $catindex]
}

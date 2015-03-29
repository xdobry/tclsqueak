IDE::XOIntroProxy instproc moveToCategoryBForObject {object method category {postFix Procs}} {
    my uncategoryForBForObject $object $method $postFix

    if {$category eq "_all_categories" || $category eq "_uncategorized"} return
    set catindex [my addCategoryBForObject $object $category $postFix]

    set cm [my getMetadataForObject $object categoriesMethods$postFix]
    set category [concat [lindex $cm $catindex] $method]
    set cm [lreplace $cm $catindex $catindex $category]
    my setMetadataForObject $object categoriesMethods$postFix $cm
}

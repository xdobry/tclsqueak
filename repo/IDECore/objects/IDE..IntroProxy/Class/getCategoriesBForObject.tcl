IDE::IntroProxy proc getCategoriesBForObject {object {postFix Procs}} {
    my initCategoriesForObject $object $postFix

    return [::concat [my getMetadataForObject $object categories$postFix] _all_categories _uncategorized]
}

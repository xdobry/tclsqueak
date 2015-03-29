IDE::ClassMethodDescription instproc setCategory category {
    if {$category ne ""} {
        [my getIntroProxy] moveToCategoryBForObject [my getObjectName] [my getName] $category
    }
}

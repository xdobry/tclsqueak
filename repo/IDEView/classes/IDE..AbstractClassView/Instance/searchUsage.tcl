IDE::AbstractClassView instproc searchUsage current {
    [my getViewMaster] showSearchResult [IDE::CodeSearch searchTypeUsage $current]
}

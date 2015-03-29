IDE::XOIntroProxy instproc renameCategoryBForObject {object oldname newname {postFix Procs}} {
    if {![my hasMetadataForObject $object categories$postFix]} {return 0}
    set categories [my getMetadataForObject $object categories$postFix]
    if {[set index [lsearch $categories $oldname]]<0} {
	return 0
    }
    set categories [lreplace $categories $index $index $newname]
    my setMetadataForObject $object categories$postFix $categories
    return 1
}

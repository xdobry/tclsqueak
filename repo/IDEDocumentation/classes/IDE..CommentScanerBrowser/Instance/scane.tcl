IDE::CommentScanerBrowser instproc scane {} {
    my instvar importedComments
    set importedComments 0
    set files [[self]::files selectedItem]
    foreach file $files {
        my scaneFile $file
    }
    IDE::Dialog message "[llength $files] was scaned, $importedComments imperted comments"
}

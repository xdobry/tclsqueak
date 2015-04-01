IDE::CompFileExporter instproc exportMethod {directory method} {
    set fileMethodName [my getFileName [$method getName]]
    my writeFileData $directory $fileMethodName.tcl [$method getBody]
    my writeFileDataIfContent $directory $fileMethodName.txt [$method getComment]
    set category [$method getCategory]
    if {$category ni  {"_all_categories" ""}} {
        my writeFileDic $directory $fileMethodName.meta [dict create category $category]
    }
}

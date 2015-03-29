IDE::CompFileExporter instproc writeFileDataIfContent {dir fileName content} {
    if {$content ne ""} {
        my writeFileData $dir $fileName $content
    }
}

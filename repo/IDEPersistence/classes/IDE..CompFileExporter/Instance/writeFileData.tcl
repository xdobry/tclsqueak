IDE::CompFileExporter instproc writeFileData {dir fileName content} {
    set out [open [file join $dir [my getFileName $fileName]] w]
    fconfigure $out -translation lf
    puts -nonewline $out $content

    close $out
}

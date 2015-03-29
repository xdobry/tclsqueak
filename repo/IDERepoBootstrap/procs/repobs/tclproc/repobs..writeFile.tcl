proc repobs::writeFile {file content} {
    set out [open $file w]
    puts -nonewline $out $content
    close $out
}

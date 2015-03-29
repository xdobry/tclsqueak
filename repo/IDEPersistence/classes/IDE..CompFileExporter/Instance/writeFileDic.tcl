IDE::CompFileExporter instproc writeFileDic {dir fileName dic} {
    if {[dict size $dic]==0} {
        return
    }
    set out [open [file join $dir [my getFileName $fileName]] w]
    dict for {key value} $dic {
        puts $out [list $key $value]
    }
    close $out
}

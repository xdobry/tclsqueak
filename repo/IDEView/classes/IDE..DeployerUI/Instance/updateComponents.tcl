IDE::DeployerUI instproc updateComponents {} {
    my instvar checked components startScript

    set ncomps [list]
    foreach n [array names checked] {
        if {$checked($n)} {
            lappend ncomps $n
        }
    }
    set components $ncomps
    
    set startScript [my @startScript getText]
}

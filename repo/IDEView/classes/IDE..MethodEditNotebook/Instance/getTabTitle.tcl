IDE::MethodEditNotebook instproc getTabTitle {tvclass tvtype tmethod} {
    if {$tvtype eq "Component" || [string range $tvtype end-2 end] eq "Def"} {
        return $tvclass
    }
    if {[string range $tvtype end-9 end] eq "ProcsGroup"} {
        return [$tvclass getName]
    }
    return $tmethod
}

IDE::IntroProxy proc stripNamespace name {
    if {[string match ::xotcl::* $name]} {
        string range $name 9 end
    } else {
        string trimleft $name  :
    }
}

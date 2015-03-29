IDEDBConnectFrame instproc init {} {
    my instvar win parameter connectionObject types writefile
    my requireNamespace
    frame $win

    set f $win.lframe
    array set par_array [my connectArgs]
    set y 0
    foreach pitem [$connectionObject getconnectargs] {
        set name [lindex $pitem 0]
        set type [lindex $pitem 1]
        if {$type eq "file" && $writefile} {
            set type wfile
        }
        set defaultValue [lindex $pitem 2]
        if {[info exists par_array($name)]} {
            set defaultValue $par_array($name)
        }
        lappend types $type
        lappend parameter $name
        label $win.l${name} -text $name
        switch $type {
           file {
               label $win.f${name} -relief sunken -border 2 -width 50 -anchor w
               button $win.$name -text "..." -command [list [self] changeFile $name r]
               grid $win.l${name} -row $y -column 0 -sticky e
               grid $win.f${name} -row $y -column 1 -sticky e
               grid $win.$name -row $y -column 2
               if {$defaultValue ne ""} {
                   $win.f${name} configure -text $defaultValue
               }
           }
           wfile {
               label $win.f${name} -relief sunken -border 2 -width 50 -anchor w
               button $win.$name -text "..." -command [list [self] changeFile $name w]
               grid $win.l${name} -row $y -column 0 -sticky e
               grid $win.f${name} -row $y -column 1 -sticky e
               grid $win.$name -row $y -column 2
               if {$defaultValue ne ""} {
                   $win.f${name} configure -text $defaultValue
               }
           }
           password {
               entry $win.$name -show *
               grid $win.l${name} -row $y -column 0 -sticky e
               grid $win.$name -row $y -column 1 -columnspan 2 -sticky w
               if {$defaultValue ne ""} {
                   $win.$name insert 0 $defaultValue
               }
           }
           list {
               set olist [lindex $pitem 3]
               if {[lsearch -exact $olist $defaultValue]<=0} {
                   set defaultValue [lindex $olist 0]
               }
               my set optionMenu$name $defaultValue
               tk_optionMenu $win.$name [self]::optionMenu$name {*}$olist
               grid $win.l${name} -row $y -column 0 -sticky e
               grid $win.$name -row $y -column 1 -columnspan 2 -sticky w
           }
           default {
               entry $win.$name
               grid $win.l${name} -row $y -column 0 -sticky e
               grid $win.$name -row $y -column 1 -columnspan 2 -sticky w
               if {$defaultValue ne ""} {
                   $win.$name insert 0 $defaultValue
               }
           }
        }
        incr y
    }
}

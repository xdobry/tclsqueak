IDE::TclKitDeployer instproc startScriptInvocation {} {
    my instvar isXOTclcode nopackages onefile
    set ret {package require starkit
starkit::startup
set progdir $::starkit::topdir
}

    if {$isXOTclcode} {
        append ret {if {$tcl_platform(platform) eq "windows"} {
    set ad [pwd]
    cd $tcl_library
    package require XOTcl
    package require Tk
    cd $ad
}
if {![info exists xotcl::version]} {
    package require XOTcl
}

if {![xotcl::Object isobject Object]} {
   namespace import xotcl::*
}
}
   }
   if {!$nopackages && !$onefile} {
      append ret {lappend auto_path $::starkit::topdir} \n
   } 
   return $ret
}

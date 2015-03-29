proc repobs::main_help {} {
    puts {tclsquak repo tool
supported command:

help : print this help
dump ?-aspackage? ?-nocomments? comp ... : dump repository components to stdout
start ?-require "tcl packages"? ?-script "...." ? comp ... : source and start component. optional script
startide : start IDE from file repository or sqlite repository if exists
export ?-todir directory? ?-nocomments? ?comp ...? : export chosen or all compoents from file repo to direcotry as regular tcl packages
}
}

IDEStarter proc showHelpAndExit {} {
    puts "Following command line parameter are supported:"
    foreach desc [my argumentsDescription] {
        puts [join $desc " : "]
    }
    exit
}

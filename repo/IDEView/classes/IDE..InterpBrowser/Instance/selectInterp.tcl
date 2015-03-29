IDE::InterpBrowser instproc selectInterp interp {
    my @introproxy interp $interp

    set rez ""
    append rez "interp: " $interp \n
    append rez "issafe: " [interp issafe $interp] \n
    set aliases [interp aliases $interp]
    append rez "aliases: " [join $aliases ,] \n
    foreach a $aliases {
        append rez " alias $a [interp alias $interp $a]\n"
    }
    append rez "hidden: " [join [interp hidden $interp] ,] \n
    append rez "slaves: " [join [interp slaves $interp] ,] \n

    my @edit setText $rez
}

IDE::RegexpBrowser instproc makeHelpWindow w {
     my instvar data
     global tcl_platform
     if {$tcl_platform(platform) == "windows"} {
        set sfont {Courier 8}
        set sbfont {Courier 8 bold}
    } else {
        set sfont 6x13
        set sbfont 6x13bold
    }
    set data(w:help) [text $w.help -font $sfont -bd 0 -height 9 -wrap none -bg [$w cget -bg]]
    $w.help insert 1.0 "\n\n\n\n\n\n\n\n"
    $w.help insert 1.0 {\a  alert              \n     newline     \0    char 0       \d [[:digit:]]    \A beginning of the string }
    $w.help insert 2.0 {\b  backspace          \r     carriage    \xyz  octal code   \D [^[:digit:]]   \Z end of string }
    $w.help insert 3.0 {\B  synomyn for \      \t     tab                            \s [[:space:]]    \m beginning of a word}
    $w.help insert 4.0 {\cX same as X & 0x1F   \uwxyz unicode     \x    backref      \S [^[:space:]]   \M end of a word}
    $w.help insert 5.0 {\e  ESC                \v     vert tab                       \w [[:alnum:]_]   \y beginning or end of a word}
    $w.help insert 6.0 {\f  form feed          \xhhh  hexa code                      \W [^[:alnum:]_]  \Y not beginning or end of a word}
    $w.help insert 7.0 {----------------------------------------------------------------------------------------------------------------}
    $w.help insert 8.0 {    ungreedy:          ?? single optional *? zero-many       +? at least one   {n,m}? ungreedy quantifiers}
    $w.help insert 9.0 {(?:) ghost group       (?=) lookahead     (?!) neg. lookahead}
    $w.help tag configure bold -font $sbfont
    foreach line {1 2 3 4 5 6} {
        foreach {min max} {0 2 23 25 42 44 61 63 79 82} {
            $w.help tag add bold $line.$min $line.$max
        }
    }
    $w.help tag remove bold 2.43 2.44 4.43 4.44
}

POTHelper instproc generateXLIFF {{estasTemplate 1}} {
    my instvar catalog

    package require tdom
    set file [::IDE::Dialog getSaveFile catalog.xliff]
    if {$file eq ""} return
    set f [open $file w]

    package require tdom
    fconfigure $f -encoding utf-8
    package require tdom


    set template {
    <xliff version="1.1">
    <file datatype="html" source-language="eo" date="2006-02-11">
<body>
<trans-unit translate="yes" id="0"><source>Testo de Tradukado</source></trans-unit>
</body>
</file></xliff>}

    set document [dom parse -keepEmpties $template]
    set elem [$document documentElement]
    set body [lindex [$elem selectNodes file/body] 0]
    global eeMenuTitles

    set id 0
    foreach originala $catalog {
        set orig [subst -nocommands -novariables $originala]
        set tu [$document createElement trans-unit]
        $tu setAttribute id $id
        $tu setAttribute translate yes
        set source [$document createElement source]
        $tu appendChild $source
        $body appendChild $tu
        while {[set pos [string first %s $orig]]>=0} {
            $source appendChild [$document createTextNode [string range $orig 0 [expr {$pos-1}]]]
            set it [$document createElement it]
            $it appendChild [$document createTextNode %s]
            $source appendChild $it
            set orig [string range $orig [expr {$pos+2}] end]
        }
        $source appendChild [$document createTextNode $orig]
        incr id
        if {!$estasTemplate} {
            if {[set traduko [msgcat::mc $originala]] ne $originala} {
                set target [$document createElement target]
                $tu appendChild $target
                $body appendChild $tu
                while {[set pos [string first %s $traduko]]>=0} {
                    $target appendChild [$document createTextNode [string range $traduko 0 [expr {$pos-1}]]]
                    set it [$document createElement it]
                    $it appendChild [$document createTextNode %s]
                    $target appendChild $it
                    set traduko [string range $traduko [expr {$pos+2}] end]
                }
                $target appendChild [$document createTextNode $traduko]
            }
        }
    }

    puts $f {<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xliff PUBLIC "-//XLIFF//DTD XLIFF//EN" "http://www.oasis-open.org/committees/xliff/documents/xliff.dtd">}

    puts $f [$elem asXML -indent none]
    close $f
    $document delete
}

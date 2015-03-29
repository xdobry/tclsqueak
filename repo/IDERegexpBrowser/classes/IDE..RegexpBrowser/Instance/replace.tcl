IDE::RegexpBrowser instproc replace {} {
    my instvar data v:all v:line v:lineanchor v:linestop v:nocase v_nbreplace

    set exp [$data(w:regexp) get 1.0 end-1char]
    set subst [$data(w:replace) get 1.0 end-1char]
    if {$exp == ""} {
        set v_nbreplace "empty regexp"
        return
    }

    # get sample & store it for undo
    set sample [$data(w:sample) get 1.0 end]
    set data(v:undo:sample) $sample
    set result [eval regsub ${v:all} ${v:line} ${v:lineanchor} ${v:linestop} ${v:nocase} --  [list $exp] [list $sample] [list [subst -nocommands -novariables $subst]] sample]
    my set v_nbreplace "$result replaced"
    # display result
    $data(w:sample) delete 1.0 end
    $data(w:sample) insert 1.0 $sample
}

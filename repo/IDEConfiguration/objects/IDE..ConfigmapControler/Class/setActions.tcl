IDE::ConfigmapControler proc setActions {} {
    if {[my exists actionsMaps]} return

    my array set actionsMaps {
        names {{{new Configmap}}}
        versions {
                {version {selection canVersion}}
                {{new edition} {selection isVersioned}}
                {{import from map} selection}
                {{export to map} {selection}}
                {{open in Map Browser} {selection}}
                {{save as packages} {selection}}
                {changes selection}
                {{set newest editions} {selection cmapIsEdition}}
                {load selection}
                {{load and run} selection}
                {{load all} selection}
                {{check order} {selection cmapIsEdition}}
                {info selection}
                {inspect selection}
            }
        components {
                {add {selectVersion cmapIsEdition}}
                {remove {selection cmapIsEdition}}
                {{release other} {selection cmapIsEdition}}
                {load selection}
                {info selection}
                {view selection}
                {inspect selection}
            }
        cmaps {
                {add {selectVersion cmapIsEdition}}
                {remove {selection cmapIsEdition}}
                {{release other} {selection cmapIsEdition}}
            }
     }
}

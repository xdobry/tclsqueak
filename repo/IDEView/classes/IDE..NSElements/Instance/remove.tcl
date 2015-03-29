IDE::NSElements instproc remove {} {
    my instvar vnamespace vtype velem
    set introproxy [my getIntroProxy]
    switch $vtype {
        Vars {
            my varAction unset $velem
        }
    }
}

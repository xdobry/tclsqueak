IDE::TclModeEdit instproc configureTagForRefType {twin tag reftype} {
    switch -- $reftype {
        cmd {
            $twin tag configure $tag -foreground {} -font textfontbold
        }
        object {
            $twin tag configure $tag -foreground chocolate4 -font textfontbold
        }
        var {
            $twin tag configure $tag -foreground blue4 -font textfontbold
        }
        default {
            $twin tag configure $tag -foreground chocolate4 -font {}
        }
    }
}

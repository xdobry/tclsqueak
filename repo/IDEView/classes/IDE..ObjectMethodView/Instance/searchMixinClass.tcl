IDE::ObjectMethodView instproc searchMixinClass {object method} {
    foreach c [$object info mixin] {
        foreach sc [concat $c [$c info heritage]] {
            if {[$sc info instprocs $method] ne ""} {return $sc}
        }
    }
}

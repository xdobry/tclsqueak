IDE::MethodDescription proc getFreshInserted {} {
    ide::lselect each [concat [IDE::InstanceMethodDescription info instances] [IDE::ClassMethodDescription info instances] [IDE::TclProcsDescription info instances]] {
        [$each isPersistent] && [$each istFreshInserted]
    }
}

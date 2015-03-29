IDE::NSElements instproc varAction args {
    [my getIntroProxy] inspectEvalNs [my set vnamespace] $args
}

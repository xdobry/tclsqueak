IDE::ObjectDescription instproc getMetadataText {} {
    [my getCompIntroProxy] metadataAsScriptPurForObject [my getObject]
}

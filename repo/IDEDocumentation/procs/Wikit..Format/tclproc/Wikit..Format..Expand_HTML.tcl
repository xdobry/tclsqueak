proc Wikit::Format::Expand_HTML str {
      StreamToHTML [TextToStream $str] {} {}
    }

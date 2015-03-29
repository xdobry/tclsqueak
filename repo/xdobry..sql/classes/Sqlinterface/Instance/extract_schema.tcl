Sqlinterface instproc extract_schema visitor {
    foreach table [my getTables] {
        $visitor newtable $table
        my extract_table $visitor $table
    }
}

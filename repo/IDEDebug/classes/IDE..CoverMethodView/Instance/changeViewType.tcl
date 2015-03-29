IDE::CoverMethodView instproc changeViewType type {
    my set cvtype $type
    my selectFor [my set vclass] [my set vcategories] [my set vtype]
}

IDE::MethodCategoryView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms enableList isValidContext

    $ms addCheckButton {All by default} [self]::selectAllByDefault {}
    $ms addCommand2 New [list [self] newCategory]
    $ms addCommand2 Rename [list [self] dispatchWithSelected renameCategory] {isValidSelection}
    $ms addCommand2 Delete [list [self] dispatchWithSelected deleteCategory] {isValidSelection}
    next
}

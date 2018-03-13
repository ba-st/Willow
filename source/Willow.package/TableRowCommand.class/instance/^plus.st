Combining
+ aTableRowCommand

	^CompositeTableRowCommand applyingAll: (Array with: self with: aTableRowCommand)
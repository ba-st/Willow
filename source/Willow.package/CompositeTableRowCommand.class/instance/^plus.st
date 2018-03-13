Combining
+ aTableRowCommand

	^self class applyingAll: (
		OrderedCollection new 
			addAll: commands;
			add: aTableRowCommand;
			yourself)
instance creation
obtainingContentFrom: aContentProvider titledUsing: aTitleProvider

	^self obtainingContentFrom: aContentProvider
		applying: (OrderedCollection with: (self titleCommandUsing: aTitleProvider))
instance creation
titledUsing: aTitleProvider displayingImageAt: anImageLocation

	^self displayingImageAt: anImageLocation
		applying: (OrderedCollection with: (self titleCommandUsing: aTitleProvider))
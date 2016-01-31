accessing - private
fileResourceOf: aSelector

	| mimeType filename |

	filename := self filenameRelatedTo: aSelector.
	mimeType := self mimeTypeRelatedTo: aSelector.
	^ [ self resourceFoundAt: filename relatedTo: aSelector declaredAs: mimeType ]
		on: Error
		do: [ :ex | self handle: ex whenLookingFor: filename relatedTo: aSelector declaredAs: mimeType]
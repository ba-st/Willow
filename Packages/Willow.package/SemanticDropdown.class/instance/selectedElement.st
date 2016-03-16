accessing
selectedElement

	^ selectionHolder
		withContentDo: [ :content | content ]
		ifUnused: [ :explanations | SelectionIsInvalid signal: explanations ]
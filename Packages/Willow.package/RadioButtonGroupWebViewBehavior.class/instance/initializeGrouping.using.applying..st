initialize-release
initializeGrouping: anElementCollection using: aRadioButtonDefinition applying: aCommandCollection

	super initialize.
	commandsToComponent := aCommandCollection.
	radioButtonViews := anElementCollection
				collect: [:anElement | aRadioButtonDefinition radioButtonFor: anElement in: self].
	selectedElement := InvalidSelection new.

	self chooseElementsUsing: 
			[:anElement |
			selectedElement := anElement]
configuring
allowDeselection

	self chooseElementsUsing: 
			[:anElement |
			selectedElement := selectedElement = anElement
						ifTrue: [InvalidSelection new]
						ifFalse: [anElement]]
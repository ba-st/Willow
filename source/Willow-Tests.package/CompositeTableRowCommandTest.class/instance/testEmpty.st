tests
testEmpty

	| html command |
	
	command := CompositeTableRowCommand empty.
	html :=
		self renderUsing: [ :canvas | | component |
			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas ].
	
	self assert: html equals: '<tr></tr>'
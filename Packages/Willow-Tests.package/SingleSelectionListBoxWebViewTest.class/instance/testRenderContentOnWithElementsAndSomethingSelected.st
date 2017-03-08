tests-rendering
testRenderContentOnWithElementsAndSomethingSelected

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	listBox chooseAnySatisfying: [ :element | true ] ifNone: [ self fail ].
	html := self render: listBox.

	self assert: html equals: '<select size="5" name="1"><option value="1" selected="selected">One</option><option value="2">Two</option><option value="3">Three</option></select>'
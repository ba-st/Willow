tests-rendering
testRenderContentOnWithElements

	| dropDownList html |

	dropDownList := self newSingleSelectionView.
	dropDownList allowAnyOf: #('One' 'Two' 'Three').
	html := self render: dropDownList.

	self assert: html equals: '<select name="1"><option value="1">One</option><option value="2">Two</option><option value="3">Three</option></select>'
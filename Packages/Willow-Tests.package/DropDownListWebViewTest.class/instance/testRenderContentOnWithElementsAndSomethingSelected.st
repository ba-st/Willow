tests-rendering
testRenderContentOnWithElementsAndSomethingSelected

	| dropDownList html |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.
	dropDownList allowAnyOf: #('One' 'Two' 'Three').
	dropDownList chooseAnySatisfying: [ :element | true ] ifNone: [ self fail ].
	html := self render: dropDownList.

	self
		assert: html
		equals: '<select name="1"><option value="1" selected="selected">One</option><option value="2">Two</option><option value="3">Three</option></select>'
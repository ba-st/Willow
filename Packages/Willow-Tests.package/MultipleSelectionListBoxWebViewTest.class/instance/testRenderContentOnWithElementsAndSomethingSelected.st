tests-rendering
testRenderContentOnWithElementsAndSomethingSelected

	| listBox html |

	listBox := self newListBox.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	listBox chooseAllIn: #('Two' 'Three').
	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" multiple="multiple"><option value="1">One</option><option value="2" selected="selected">Two</option><option value="3" selected="selected">Three</option></select><input name="2" type="hidden"/>'
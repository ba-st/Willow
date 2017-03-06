tests-rendering
testRenderContentOnWithElements

	| listBox html |

	listBox := ListBoxWebView applying: CompositeComponentCommand empty.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" multiple="multiple"><option value="1">One</option><option value="2">Two</option><option value="3">Three</option></select><input name="2" type="hidden"/>'
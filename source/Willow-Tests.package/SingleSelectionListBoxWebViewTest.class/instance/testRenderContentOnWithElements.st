tests-rendering
testRenderContentOnWithElements

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" id="id2" size="5"><option value="1">One</option><option value="2">Two</option><option value="3">Three</option></select><script type="text/javascript">$("#id2").prop("selectedIndex",-1);</script>'
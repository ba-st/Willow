tests
testIdentifyIn

	| listBox html |

	listBox := self newSingleSelectionView.

	html := self
		renderUsing: [ :canvas | 
			listBox identifyIn: canvas.
			canvas render: listBox ].

	self
		assert: html equals: '<select size="5" name="2" id="list-box-id1"></select>';
		assert: listBox identifier equals: 'list-box-id1'
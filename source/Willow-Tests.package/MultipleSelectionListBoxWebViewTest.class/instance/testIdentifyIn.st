tests
testIdentifyIn

	| listBox html |

	listBox := self newListBox.

	html := self
		renderUsing: [ :canvas | 
			listBox identifyIn: canvas.
			canvas render: listBox ].

	self
		assert: html equals: '<select name="2" id="list-box-id1" multiple="multiple"></select><input name="3" type="hidden"/>';
		assert: listBox identifier equals: 'list-box-id1'
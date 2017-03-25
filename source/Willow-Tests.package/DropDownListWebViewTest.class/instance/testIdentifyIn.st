tests-configuring
testIdentifyIn

	| dropDownList html |

	dropDownList := self newSingleSelectionView.

	html := self
		renderUsing: [ :canvas | 
			dropDownList identifyIn: canvas.
			canvas render: dropDownList ].

	self
		assert: html equals: '<select name="2" id="drop-down-list-id1"></select>';
		assert: dropDownList identifier equals: 'drop-down-list-id1'
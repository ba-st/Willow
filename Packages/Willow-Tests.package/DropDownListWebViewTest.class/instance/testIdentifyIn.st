tests-configuring
testIdentifyIn

	| dropDownList html |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.

	html := self
		renderUsing: [ :canvas | 
			dropDownList identifyIn: canvas.
			canvas render: dropDownList ].

	self assert: html equals: '<select name="2" id="drop-down-list-id1"></select>'
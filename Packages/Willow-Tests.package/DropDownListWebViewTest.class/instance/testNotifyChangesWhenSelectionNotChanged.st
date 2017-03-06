tests-Single Selection-API
testNotifyChangesWhenSelectionNotChanged

	| dropDownList |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.
	dropDownList allowAnyOf: #(1).
	dropDownList notifyChangesTo: self.

	notificationWasReceived := true.

	dropDownList chooseAnySatisfying: [ :element | false ] ifNone: [ notificationWasReceived := false ].

	self
		deny: notificationWasReceived;
		assert: (dropDownList currentSelectionIfNone: [ 0 ]) equals: 0
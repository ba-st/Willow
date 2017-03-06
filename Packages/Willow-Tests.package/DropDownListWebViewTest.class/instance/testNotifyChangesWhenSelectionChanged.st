tests-Single Selection-API
testNotifyChangesWhenSelectionChanged

	| dropDownList |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.
	dropDownList allowAnyOf: #(1).

	dropDownList notifyChangesTo: self.

	notificationWasReceived := false.
	dropDownList chooseAnySatisfying: [ :element | true ] ifNone: [ self fail ].

	self assert: (dropDownList currentSelectionIfNone: [ self fail ]) equals: 1.
	self assert: notificationWasReceived
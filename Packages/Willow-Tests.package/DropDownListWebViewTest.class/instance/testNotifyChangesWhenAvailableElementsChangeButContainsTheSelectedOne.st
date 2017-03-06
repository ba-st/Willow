tests-Single Selection-API
testNotifyChangesWhenAvailableElementsChangeButContainsTheSelectedOne

	| dropDownList |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.
	dropDownList allowAnyOf: #(1).

	dropDownList notifyChangesTo: self.
	dropDownList chooseAnySatisfying: [ :element | element = 1 ] ifNone: [ self fail ].

	notificationWasReceived := false.

	self assert: (dropDownList currentSelectionIfNone: [ self fail ]) equals: 1.
	
	dropDownList allowAnyOf: #(2 4 3 1).
	
	self assert: notificationWasReceived.
	self assert: (dropDownList currentSelectionIfNone: [ self fail ]) equals: 1
tests-Single Selection-API
testNotifyChangesTo

	| dropDownList |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.
	dropDownList notifyChangesTo: self.

	notificationWasReceived := false.
	dropDownList disallowAll.

	self assert: notificationWasReceived
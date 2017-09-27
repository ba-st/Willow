tests-container-API
testNotifyChangesTo

	| textField |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].

	textField notifyChangesTo: self.
	notificationWasReceived := false.
	textField changeContentsTo: ''.
	self assert: notificationWasReceived
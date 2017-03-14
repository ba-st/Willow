tests-container-API
testNotifyChangesTo

	| field |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty.

	field notifyChangesTo: self.
	notificationWasReceived := false.
	field changeContentsTo: ''.
	self assert: notificationWasReceived
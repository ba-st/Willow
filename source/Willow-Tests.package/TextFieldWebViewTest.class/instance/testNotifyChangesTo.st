tests-container-API
testNotifyChangesTo

	| field |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :command |  ].

	field notifyChangesTo: self.
	notificationWasReceived := false.
	field changeContentsTo: ''.
	self assert: notificationWasReceived
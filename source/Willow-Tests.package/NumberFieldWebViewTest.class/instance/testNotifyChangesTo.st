tests-number-container-API
testNotifyChangesTo

	| field |

	field := NumberFieldWebView applying: [  ] transformingWith: IntegerCodec new.

	field notifyChangesTo: self.
	notificationWasReceived := false.
	field changeNumberTo: -5.
	self assert: notificationWasReceived
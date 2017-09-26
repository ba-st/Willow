tests-number-container-API
testNotifyChangesTo

	| numberField |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	numberField notifyChangesTo: self.
	notificationWasReceived := false.
	numberField changeNumberTo: -5.
	self assert: notificationWasReceived
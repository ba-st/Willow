tests
testNotifyChangesTo

	| dateField |

	dateField := DateFieldWebView applying: [ :field |  ].

	dateField notifyChangesTo: self.
	notificationWasReceived := false.
	dateField changeDateTo: Date today.
	self assert: notificationWasReceived
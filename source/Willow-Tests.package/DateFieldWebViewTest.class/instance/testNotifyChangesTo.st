tests
testNotifyChangesTo

	| field |

	field := DateFieldWebView applying: [  ].

	field notifyChangesTo: self.
	notificationWasReceived := false.
	field changeDateTo: Date today.
	self assert: notificationWasReceived
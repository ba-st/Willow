tests
testNotifyChangesTo

	| field |

	field := DateFieldWebView applying: CompositeComponentCommand empty.

	field notifyChangesTo: self.
	notificationWasReceived := false.
	field changeDateTo: Date today.
	self assert: notificationWasReceived
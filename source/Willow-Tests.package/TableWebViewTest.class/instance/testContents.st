tests-container-API
testContents

	| table |

	table := TableWebView headlessDefinedBy: #() applying: [ :theTable |  ].

	self assert: table contents isEmpty.

	notificationWasReceived := false.
	table
		notifyChangesTo: self;
		changeContentsTo: #(1 2 3).

	self
		assert: table contents equals: #(1 2 3);
		assert: notificationWasReceived
tests-Accessing
testHandleAjaxErrorCallFunction

	self
		assert: WillowJavascriptNamespace new handleAjaxErrorCallFunction asJavascript
		equals: 'Willow.handleAjaxErrorCall'
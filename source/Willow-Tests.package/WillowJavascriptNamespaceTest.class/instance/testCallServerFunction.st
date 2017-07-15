tests-Accessing
testCallServerFunction

	self
		assert: WillowJavascriptNamespace new callServerFunction asJavascript
		equals: 'Willow.callServer'
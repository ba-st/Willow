tests-Configuring
testSetCallServerFunctionTo

	self
		assert:
			(WillowJavascriptNamespace new
				setCallServerFunctionTo: (JSFunction new arguments: #('arguments'))) asJavascript
		equals: 'Willow.callServer=function(arguments){}'
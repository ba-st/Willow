tests-Configuring
testSetHandleAjaxErrorCallFunctionTo

	self
		assert:
			(WillowJavascriptNamespace new
				setHandleAjaxErrorCallFunctionTo: (JSFunction new arguments: #('xmlHttpRequest' 'textStatus' 'errorThrown')))
				asJavascript
		equals: 'Willow.handleAjaxErrorCall=function(xmlHttpRequest,textStatus,errorThrown){}'
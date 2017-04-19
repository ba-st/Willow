tests-Configuring
testConfigureHandleAjaxErrorCallFunction

	self
		assert: (WillowJavascriptNamespace new setHandleAjaxErrorCallFunction: (JSFunction new arguments: #('xmlHttpRequest' 'textStatus' 'errorThrown'))) asJavascript
		equals: 'Willow.handleAjaxErrorCall=function(xmlHttpRequest,textStatus,errorThrown){}'
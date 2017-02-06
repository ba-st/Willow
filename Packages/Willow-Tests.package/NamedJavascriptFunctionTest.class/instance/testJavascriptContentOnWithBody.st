tests-printing
testJavascriptContentOnWithBody

	| jsFunction javascript |

	jsFunction := NamedJavascriptFunction named: WillowConstants handleAjaxErrorCallFunctionName.
	jsFunction arguments: #('theXMLHttpRequest' 'textStatus' 'errorThrown').
	jsFunction << (JSStream on: 'theXMLHttpRequest') call: 'getAllResponseHeaders'.
	javascript := self render: jsFunction.
	self
		assert: javascript
		equals: 'function handleAjaxErrorCall(theXMLHttpRequest,textStatus,errorThrown){theXMLHttpRequest.getAllResponseHeaders()}'
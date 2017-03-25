tests-printing
testJavascriptContentOn

	| globalFunctionCall javascript |

	globalFunctionCall := JavascriptFunctionCall for: 'empty' withAll: #().
	javascript := self render: globalFunctionCall.
	self assert: javascript equals: 'empty()'
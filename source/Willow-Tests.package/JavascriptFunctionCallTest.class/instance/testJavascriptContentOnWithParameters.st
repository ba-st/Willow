tests-printing
testJavascriptContentOnWithParameters

	| globalFunctionCall javascript |

	globalFunctionCall := JavascriptFunctionCall
		for: 'enable'
		withAll:
			{true.
			JSStream this}.
	javascript := self render: globalFunctionCall.
	self assert: javascript equals: 'enable(true,this)'
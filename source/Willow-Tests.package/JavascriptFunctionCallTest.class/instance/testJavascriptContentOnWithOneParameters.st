tests-printing
testJavascriptContentOnWithOneParameters

	| globalFunctionCall javascript |

	globalFunctionCall := JavascriptFunctionCall for: 'enable' with: true.
	javascript := self render: globalFunctionCall.
	self assert: javascript equals: 'enable(true)'
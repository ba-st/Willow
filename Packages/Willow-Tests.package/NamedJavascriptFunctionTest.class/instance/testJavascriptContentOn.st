tests-printing
testJavascriptContentOn

	| emptyJsFunction javascript |

	emptyJsFunction := NamedJavascriptFunction named: 'empty'.
	javascript := self render: emptyJsFunction.
	self assert: javascript equals: 'function empty(){}'
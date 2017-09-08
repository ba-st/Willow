tests-printing
testName

	| emptyJsFunction |

	emptyJsFunction := NamedJavascriptFunction named: 'empty'.

	self assert: emptyJsFunction name equals: 'empty'
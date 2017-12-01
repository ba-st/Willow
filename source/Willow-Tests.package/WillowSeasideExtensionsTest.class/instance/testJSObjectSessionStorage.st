tests
testJSObjectSessionStorage

	| jsObject |

	jsObject := JSStream this sessionStorage.

	self assert: jsObject asJavascript equals: 'sessionStorage'
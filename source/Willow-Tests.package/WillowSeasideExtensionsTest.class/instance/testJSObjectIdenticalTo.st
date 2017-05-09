tests
testJSObjectIdenticalTo

	| jsObject |

	jsObject := JSStream this identicalTo: 0.

	self assert: jsObject asJavascript equals: 'this===0'
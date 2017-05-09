tests
testJSObjectEqualTo

	| jsObject |

	jsObject := JSStream this equalTo: 0.

	self assert: jsObject asJavascript equals: 'this==0'
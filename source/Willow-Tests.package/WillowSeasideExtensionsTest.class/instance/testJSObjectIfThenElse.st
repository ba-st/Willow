tests
testJSObjectIfThenElse

	| jsObject |

	jsObject := (JSStream this equalTo: 0) nonInlinedThen: true else: false.

	self assert: jsObject asJavascript equals: 'if(this==0){true} else {false}'
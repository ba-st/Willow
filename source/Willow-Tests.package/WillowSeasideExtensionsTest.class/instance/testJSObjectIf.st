tests
testJSObjectIf

	| jsObject |

	jsObject := (JSStream this equalTo: 0) nonInlinedThen: true.

	self assert: jsObject asJavascript equals: 'if(this==0){true}'
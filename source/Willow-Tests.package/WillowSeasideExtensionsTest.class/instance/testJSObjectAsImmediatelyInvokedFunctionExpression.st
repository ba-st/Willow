tests
testJSObjectAsImmediatelyInvokedFunctionExpression

	| jsObject |

	jsObject := (JSStream this equalTo: 0) asImmediatelyInvokedFunctionExpression.

	self assert: jsObject asJavascript equals: '(function(){this==0}())'
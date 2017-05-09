tests
testJSDeclareGlobalNamespace

	| jsObject |

	jsObject := JSDeclareGlobalNamespace named: WillowJavascriptNamespace new.

	self assert: jsObject asJavascript equals: 'var Willow'
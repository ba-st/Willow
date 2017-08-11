tests - Instance Creation
testForEvaluationOfWithAll

	| interpreter html |

	interpreter := WebInteractionInterpreter forEvaluationOf: #onBlur: withAll: #(firstThis thenThat).
	interpreter inform: 'The message is the medium'.
	html := self configureTextInputWith: interpreter.
	self assert: html equals: '<input onblur="function(firstThis,thenThat){alert(&quot;The message is the medium&quot;)}" type="text"/>'
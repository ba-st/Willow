tests - Instance Creation
testForDelayedModelLoading

	| interpreter html |

	"This interpreter should not be used directly. See references to the class."
	interpreter := WebInteractionInterpreter forDelayedModelLoading.
	interpreter submitFormStyledAs: 'the-specified-style'.
	html := self configureScriptWith: interpreter.
	self
		assert: html
		equals: '<div></div><script type="text/javascript">$("form.the-specified-style").submit();</script>'
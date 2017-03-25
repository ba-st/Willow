tests-accessing
testEvaluatingAsConditionToRender

	| html |

	command := RenderingCommand evaluating: [ false ] asConditionToRender: identifiedView.

	self assert: command clientIndependentActions size equals: 1.
	command clientIndependentActions do: [ :action | self deny: action value ].


	html := self
		renderUsing: [ :canvas | 
			| script |

			script := canvas javascript.
			identifiedView identifyIn: canvas.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].

			canvas anchor script: (canvas jQuery this onClick: script) ].

	"The function must be empty because the condition is false"
	self assert: html equals: '<a id="id2"></a><script type="text/javascript">$("#id2").click(function(){});</script>'
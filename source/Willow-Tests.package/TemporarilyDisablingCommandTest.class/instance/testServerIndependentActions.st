tests-accessing
testServerIndependentActions

	| command html |

	command := TemporarilyDisablingCommand
		transformingCurrentViewInto: [ :canvas | canvas span class: WillowCssStyles loading ].
	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			command serverIndependentActions do: [ :action | action value: script value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){disabledComponent=$(this).html();$(this).addClass("willow-disabled-component").attr("disabled",true).html("<span class=\"willow-loading\"></span>")});</script>'
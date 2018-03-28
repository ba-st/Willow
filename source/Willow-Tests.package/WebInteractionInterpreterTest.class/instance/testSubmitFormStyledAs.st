tests - Configuring - Serialization
testSubmitFormStyledAs

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.

	html := self
		renderUsing: [ :canvas | 
			| form anchor |

			form := canvas form.
			form class: WillowCssStyles willow.
			anchor := canvas anchor.
			anchor id: '16'.
			interpreter submitFormStyledAs: WillowCssStyles willow.
			interpreter applyTo: anchor on: canvas ].

	self
		assert: html
		equals:
			'<form accept-charset="utf-8" method="post" action="/" class="willow"></form><a id="16"></a><script type="text/javascript">$("#16").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
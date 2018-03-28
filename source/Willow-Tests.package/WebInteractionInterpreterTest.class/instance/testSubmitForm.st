tests - Configuring - Serialization
testSubmitForm

	| interpreter html id |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| form anchor |

			form := canvas form.
			form id: id.
			anchor := canvas anchor.
			anchor id: '16'.
			interpreter submitForm: form.
			interpreter applyTo: anchor on: canvas ].

	self
		assert: html
		equals:
			'<form accept-charset="utf-8" method="post" action="/" id="15"></form><a id="16"></a><script type="text/javascript">$("#16").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'
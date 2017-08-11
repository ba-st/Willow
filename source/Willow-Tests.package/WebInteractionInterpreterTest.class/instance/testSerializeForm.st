tests - Configuring - Serialization
testSerializeForm

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
			interpreter serializeForm: form.
			interpreter applyTo: anchor on: canvas ].

	self
		assert: html
		equals:
			'<form accept-charset="UTF-8" method="post" action="/" id="15"></form><a id="16"></a><script type="text/javascript">$("#16").click(function(){Willow.callServer({"type":"POST","url":"/","data":["1",$("#15").serialize()].join("&")})});</script>'
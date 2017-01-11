utility
apply: aWebInteractionObject toComponentDefinedBy: aComponentProvider afterApplyingDo: aPostAction

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: false;
		codec: self codec.
	html := builder
		render: [ :canvas | 
			| component |

			component := aComponentProvider cull: canvas.
			[ aWebInteractionObject applyTo: component on: canvas ]
				on: WACurrentRequestContext
				do: [ :ex | ex resume: self ].
			aPostAction value: canvas value: component ].
	^ html
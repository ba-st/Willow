utility
apply: aWebInteractionObject toComponentDefinedBy: aComponentProvider afterApplyingDo: aPostAction

	^self renderUsing: [:canvas | | component |
		component := aComponentProvider cull: canvas.
		aWebInteractionObject applyTo: component on: canvas.
		aPostAction value: canvas value: component]
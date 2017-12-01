private - accessing
commandToExecuteOn: aCanvas

	^ serverIndependentActions isEmpty
		ifTrue: [ self asynchronousCallToAffect: aCanvas ]
		ifFalse: [ | script |

			script := aCanvas javascript.
			serverIndependentActions do: [ :action | action value: script value: aCanvas ].
			self shouldApplyAsynchronousCall
				ifTrue: [ script << (self asynchronousCallToAffect: aCanvas) ].
			script ]
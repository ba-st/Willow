processing
applyTo: aComponent on: aCanvas

	minimumHolder withContentDo: [ :minimum | aComponent attributeAt: 'min' put: minimum ].
	maximumHolder withContentDo: [ :maximum | aComponent attributeAt: 'max' put: maximum ]
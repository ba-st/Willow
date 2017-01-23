processing
applyTo: aComponent on: aCanvas

	minimumHolder withContentDo: [ :minimum | aComponent min: minimum ].
	maximumHolder withContentDo: [ :maximum | aComponent max: maximum ]
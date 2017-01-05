accessing - private
containerComponentOn: aCanvas

	| containerComponent |

	containerComponent := aCanvas div class: 'ui checkbox'.
	componentCommand applyTo: containerComponent on: aCanvas.
	labelHolder
		withContentDo: [ :content |  ]
		ifUnused: [ :explanations | containerComponent class: 'fitted' ].
	^ containerComponent
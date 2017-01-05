rendering - private
renderLabelFor: anIdentifier on: aCanvas

	| labelComponent |

	labelComponent := aCanvas label.
	labelHolder
		withContentDo: [ :aLabel | 
			labelComponent
				for: anIdentifier;
				with: aLabel ]
		ifUnused: [ :explanations |  ]
accessing
modelLoadingActions

	^ Array
		with: [ :aScript :aCanvas | 
			shouldRender
				ifTrue: [ identifiedViews
						do: [ :identifiedView | 
							identifiedView identifyIn: aCanvas.
							aScript << (aCanvas jQuery id: identifiedView identifier) html: identifiedView view ] ] ]
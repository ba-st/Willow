accessing
modelLoadingActions
	^ Array
		with: [ :aScript :aCanvas | 
			shouldRender
				ifTrue: [ identifiedViews do: [ :identifiedView | aScript << (aCanvas jQuery id: identifiedView id) html: identifiedView view ] ] ]
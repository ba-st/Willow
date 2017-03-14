accessing
modelLoadingActions

	^Array
		with: [:aScript :aCanvas | aScript << (componentProvider value: aCanvas) triggerFocus  ]
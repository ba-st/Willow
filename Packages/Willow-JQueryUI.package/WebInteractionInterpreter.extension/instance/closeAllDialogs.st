*Willow-JQueryUI
closeAllDialogs
	self
		deprecated: 'Please use #closeAllJQueryUIDialogs instead.'
		transformWith: '`@receiver closeAllDialogs' -> '@receiver closeAllJQueryUIDialogs'.
	self flag: '@taby remove this method when the senders are fixed'.
	self closeAllJQueryUIDialogs
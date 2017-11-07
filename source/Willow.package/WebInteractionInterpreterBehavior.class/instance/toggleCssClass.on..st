Configuring - CSS
toggleCssClass: aCssStyle on: anIdentifiedWebView

	self
		toggleCssClass: aCssStyle
		onComponentsMatching: [ :javascript | 
			anIdentifiedWebView identifyIn: javascript.
			javascript jQuery id: anIdentifiedWebView identifier ]
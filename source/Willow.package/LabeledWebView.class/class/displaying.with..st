instance creation
displaying: aWebView with: aName

	self
		deprecated: 'Use displaying:boundTo:applying: '
		transformWith: '̀@receiver displaying: ̀@aWebView with: ̀@aName' -> '̀@receiver displaying: ̀@aName boundTo: ̀@aWebView  applying: CompositeComponentCommand empty'.
	^ self displaying: aName boundTo: aWebView applying: CompositeComponentCommand empty